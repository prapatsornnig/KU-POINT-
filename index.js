const fs = require('fs');
const path = require('path');
const Multer = require('multer');
const express = require('express');
const bodyParser = require('body-parser');
const createError = require('http-errors'); // เรียกใช้งาน http-errors module

const {
  addProduct,
  buyProduct,
  getProduct,
  getAccounts,
  unlockAccount,
  getAllProducts,
  getBalance,
  //--------------------
  addArticle,
  buyArticle,
  getArticle,
  getAllArticles,
  getAllHistorys,
  getAllActivity,
  //--------------------
  //getBalanceToken,
} = require('./blockchain');

// IMAGE UPLOADER SESSING
const upload = Multer({ dest: 'public/images/', limits: { files: 1 } });
const MAX_IMAGE_SIZE_BYTES = 10485760;

const app = express();
const appPort = 3000;

// ส่วนของการใช้งาน router module ต่างๆ 
const homeRouter = require('./routes/home')
const loginRouter = require('./routes/login')
const logoutRouter = require('./routes/logout')
const registerRouter = require('./routes/register')
const indexRouter = require('./routes/index')
const articRouter = require('./routes/artic')

const historyRouter = require('./routes/history')
const acthisRouter = require('./routes/acthis')

const edittRouter = require('./routes/editt')
const newsRouter = require('./routes/news')
const readRouter = require('./routes/read')
const newslistRouter = require('./routes/newslist')
const newslist2Router = require('./routes/newslist2')
const editnewsRouter = require('./routes/editnews')
const editmemberRouter = require('./routes/editmember')
const memberRouter = require('./routes/member')

const userRouter = require('./routes/users')
const userApi = require('./api/users')
const provinceApi = require('./api/provinces')

const dbnewsApi = require('./api/dbnews')

// view engine setup
app.set('views', path.join(__dirname, 'views'));
app.set('view engine', 'ejs');
//app.set('view options', {delimiter: '%'});
// app.set('env','production')

app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: true }));
app.use(express.static(path.join(__dirname, 'public')))

const bootstrapJS = express.static(path.join(__dirname, 'node_modules/bootstrap/dist/js/bootstrap.min.js'));
const bootstrapCSS = express.static(path.join(__dirname, 'node_modules/bootstrap/dist/css/bootstrap.min.css'));
const toastrCSS = express.static(path.join(__dirname, 'node_modules/toastr/build/toastr.min.css'));
const toastrJS = express.static(path.join(__dirname, 'node_modules/toastr/build/toastr.min.js'));
const jquery = express.static(path.join(__dirname, 'node_modules/jquery/dist/jquery.min.js'));
const holderjs = express.static(path.join(__dirname, 'node_modules/holderjs/holder.min.js'));

app.use('/js/jquery.min.js', jquery);
app.use('/js/holder.min.js', holderjs);
app.use('/js/bootstrap.min.js', bootstrapJS);
app.use('/css/bootstrap.min.css', bootstrapCSS);
app.use('/js/toastr.min.js', toastrJS);
app.use('/css/toastr.min.css', toastrCSS);
app.use(express.static(path.join(__dirname, 'public')));

// เรียกใช้งาน Router
app.use('/', homeRouter)
app.use('/login', loginRouter)
app.use('/register', registerRouter)
app.use('/index', indexRouter)
app.use('/artic', articRouter)
app.use('/logout', logoutRouter)

app.use('/acthis', acthisRouter)
app.use('/history', historyRouter)
app.use('/editnews', editnewsRouter)
app.use('/news', newsRouter)
app.use('/read', readRouter)
app.use('/newslist', newslistRouter)
app.use('/newslist2', newslist2Router)
app.use('/editmember', editmemberRouter)

app.use('/user', userRouter)
app.use('/api', [userApi]) 
app.use('/api', [userApi, provinceApi])
app.use('/api', [dbnewsApi]) 

// ทำงานทุก request ที่เข้ามา 

//app.use(function(req, res, next) {
  //var err = createError(404)
  //ext(err)
//})

// ส่วนจัดการ error
//app.use(function (err, req, res, next) {
  // กำหนด response local variables 
  //res.locals.pageData = {
      //title:'Error Page'
  //}    
  //res.locals.message = err.message
  //res.locals.error = req.app.get('env') === 'development' ? err : {}

  // กำหนด status และ render หน้า error page
  //res.status(err.status || 500) // ถ้ามี status หรือถ้าไม่มีใช้เป็น 500
  //res.render('pages/error') 
//})

 app.get('/index', async (request, response, next) => {
   const accounts = await getAccounts();

   const balances = await getBalance(); //เพิ่มมา

   const products = await Promise.all((await getAllProducts()).map(pid => getProduct(pid)));

   const productss = await Promise.all((await getAllHistorys()).map(pid => getProduct(pid)));

   return response.render('pages/index', { accounts, balances, products, productss}); //เพิ่ม balance มา
 });

app.post('/products/add', upload.single('productImageInput'), async (request, response) => {
  try {
    const { productNameInput, productPriceInput, productQtyInput, productSeller, accountPassword } = request.body;
    const { file } = request;
    if (!['image/jpeg', 'image/png', 'image/gif'].includes(file.mimetype)) {
      fs.unlinkSync(file.path);
      return response.json({
        success: false,
        error: 'Please upload a file as jpeg, png, or gif.',
      });
    }

    if (file.size > MAX_IMAGE_SIZE_BYTES) {
      fs.unlinkSync(file.path);
      return response.json({
        success: false,
        error: 'Please upload smaller file. (10MB)',
      });
    }

    if (!productNameInput || !productPriceInput || !productQtyInput || !productSeller) {
      return response.json({
        success: false,
        error: 'Please fill the form.',
      });
    }

    if (!Number.isInteger(Number(productPriceInput))) {
      return response.json({
        success: false,
        error: 'Plese enter product price in number',
      });
    }

    if (!Number.isInteger(Number(productQtyInput))) {
      return response.json({
        success: false,
        error: 'Plese enter product quantity in number',
      });
    }

    const productImagePath = 'images/' + file.filename;
    const postImagePath = 'images/' + file.filename;
    const unlocked = await unlockAccount(productSeller, accountPassword);
    if (!unlocked) {
      return response.json({
        success: false,
        error: 'Please type correct account password.',
      });
    }
    const dataResult = await addProduct(productNameInput, productPriceInput, productQtyInput, productImagePath, productSeller);
    return response.json({
      success: true,
      data: { pid: dataResult.pid, transactionReceipt: dataResult.receipt },
      error: null,
    });
  } catch (error) {
    return response.json({
      success: false,
      error: error.message,
    });
  }
});

app.post('/products/buy', async (request, response) => {
  try {
    const { pid, buyer, password } = request.body;
    if (!pid) {
      return response.json({
        success: false,
        error: 'Please select product ID.',
      });
    }

    if (!buyer) {
      return response.json({
        success: false,
        error: 'Please select address to be buyer.',
      });
    }

    const unlocked = await unlockAccount(buyer, password);
    if (!unlocked) {
      return response.json({
        success: false,
        error: 'Please type correct account password.',
      });
    }

    await buyProduct(pid, buyer);
    return response.json({
      success: true,
      error: null,
    });
  } catch (error) {
    return response.json({
      success: false,
      error: error.message,
    });
  }
});

app.post('/products/:pid', async (request, response) => {
  try {
    	const { pid } = request.params;
      const result = await getProduct(pid);
      return response.json({
         success: true,
         data: result,
         error: null,
      });
  }
  catch (error) {
    return response.json({
      success: false,
      error: error.message,
    });
  }
});
//---------------------------------------------------------------------------------------------------------------------------------------
app.get('/artic', async (request, response, next) => {
  const accounts = await getAccounts();

  const balances = await getBalance(); //เพิ่มมา

  const articles = await Promise.all((await getAllArticles()).map(pid => getArticle(pid)));

  const articless = await Promise.all((await getAllActivity()).map(pid => getArticle(pid)));
  return response.render('pages/artic', { accounts, balances, articles, articless }); //เพิ่ม balance มา
});

app.post('/articles/add', upload.single('articleImageInput'), async (request, response) => {
 try {
   const { articleNameInput, articlePointInput, articlenumInput, articleSeller, accountPassword } = request.body;
   const { file } = request;
   if (!['image/jpeg', 'image/png', 'image/gif'].includes(file.mimetype)) {
     fs.unlinkSync(file.path);
     return response.json({
       success: false,
       error: 'Please upload a file as jpeg, png, or gif.',
     });
   }

   if (file.size > MAX_IMAGE_SIZE_BYTES) {
     fs.unlinkSync(file.path);
     return response.json({
       success: false,
       error: 'Please upload smaller file. (10MB)',
     });
   }

   if (!articleNameInput || !articlePointInput || !articlenumInput || !articleSeller) {
     return response.json({
       success: false,
       error: 'Please fill the form.',
     });
   }

   if (!Number.isInteger(Number(articlePointInput))) {
     return response.json({
       success: false,
       error: 'Plese enter article point in number',
     });
   }

   if (!Number.isInteger(Number(articlenumInput))) {
     return response.json({
       success: false,
       error: 'Plese enter article quantity in number',
     });
   }

   const articleImagePaths = 'images/' + file.filename;
   //const postImagePaths = 'images/' + file.filename;
   const unlocked = await unlockAccount(articleSeller, accountPassword);
   if (!unlocked) {
     return response.json({
       success: false,
       error: 'Please type correct account password.',
     });
   }
   const dataResult = await addArticle(articleNameInput, articlePointInput, articlenumInput, articleImagePaths, articleSeller);
   return response.json({
     success: true,
     data: { pid: dataResult.pid, transactionReceipt: dataResult.receipt },
     error: null,
   });
 } catch (error) {
   return response.json({
     success: false,
     error: error.message,
   });
 }
});

app.post('/articles/buy', async (request, response) => {
 try {
   const { pid, buyer, password } = request.body;
   if (!pid) {
     return response.json({
       success: false,
       error: 'Please select product ID.',
     });
   }

   if (!buyer) {
     return response.json({
       success: false,
       error: 'Please select address to be buyer.',
     });
   }

   const unlocked = await unlockAccount(buyer, password);
   if (!unlocked) {
     return response.json({
       success: false,
       error: 'Please type correct account password.',
     });
   }

   await buyArticle(pid, buyer);
   return response.json({
     success: true,
     error: null,
   });
 } catch (error) {
   return response.json({
     success: false,
     error: error.message,
   });
 }
});

app.post('/articles/:pid', async (request, response) => {
 try {
     const { pid } = request.params;
     const result = await getArticle(pid);
     return response.json({
        success: true,
        data: result,
        error: null,
     });
 }
 catch (error) {
   return response.json({
     success: false,
     error: error.message,
   });
 }
});
//-----------------------------------------------------------------------------------------------------------------------------------------
app.listen(appPort, () => console.log(`Server is running! it is listening on port ${appPort}...`));
