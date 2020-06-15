pragma solidity >=0.4.25 <0.6.0;

import "./Token.sol";

contract Artic {
    struct Article {
        string name;
        string imgPaths;
        uint256 point;
        uint256 num;
        address seller;
    }
    event AddedArticle(uint256 pid, address seller, uint256 timestamp);
    event AddedActivity(uint256 pid, address seller, uint256 timestamp);
    event BuyArticle(uint256 pid, address buyer, uint256 timestamp);
    mapping (uint256 => Article) articles;
    mapping (uint256 => address[]) buying;
    Token token;

    constructor (address _tokenAddress) public {
        token = Token(_tokenAddress);
    }

    function addArticle(
        uint256 _pid,
        string memory _name,
        uint256 _point,
        uint256 _num,
        string memory _imgPaths,
        uint256 timestamp
    ) public {
        articles[_pid] = Article({
            name: _name,
            imgPaths: _imgPaths,
            point: _point,
            num: _num,
            seller: msg.sender
        });
        emit AddedArticle(_pid, msg.sender, timestamp);
    }
//---------------------------------------------------------------------------------------------------------------
    struct BuyActivity {
        address account;
        uint256 oldBalance;
        string activityName;
        uint256 point;
        uint256 newBalance;
        string buyDateTime;
    }
    event AddedBuyActivity(uint256 aid, address buyer, uint256 oldBalance, string activityName, uint256 point, uint256 newBalance, string buyDateTime);
    mapping (uint256 => BuyActivity) buyActivitys;

    function addBuyActivity(
        uint256 _aid,
        address _account,
        uint256 _oldBalance,
        string memory _activityName,
        uint256 _point,
        uint256 _newBalance,
        string memory _buyDateTime
    ) public {
        buyActivitys[_aid] = BuyActivity({
            account: _account,
            oldBalance: _oldBalance,
            activityName: _activityName,
            point: _point,
            newBalance: _newBalance,
            buyDateTime: _buyDateTime
        });
        emit AddedBuyActivity(_aid, msg.sender, _oldBalance, _activityName, _point, _newBalance, _buyDateTime);
    }

    function getBuyActivity(uint256 _aid) public view returns (address account, uint256 oldBalance, string memory activityName, uint256 point, uint256 newBalance, string memory buyDateTime) {
        BuyActivity memory buyActivity = buyActivitys[_aid];
        return (buyActivity.account, buyActivity.oldBalance, buyActivity.activityName, buyActivity.point, buyActivity.newBalance, buyActivity.buyDateTime);
    }

//----------------------------------------------------------------------------------------------------------------

//----------------------------------------------------------------------------------------------------------------
    // function addActivity(
    //     uint256 _pid,
    //     string memory _name,
    //     uint256 _point,
    //     uint256 _num,
    //     string memory _imgPaths,
    //     uint256 timestamp
    // ) public {
    //     articles[_pid] = Article({
    //         name: _name,
    //         imgPaths: _imgPaths,
    //         point: _point,
    //         num: _num,
    //         seller: msg.sender
    //     });
    //     emit AddedActivity(_pid, msg.sender, timestamp);
    // }
//----------------------------------------------------------------------------------------------------------------
    function getArticle(uint256 _pid) public view returns (string memory name, uint256 point, uint256 num, string memory imgPaths, address seller) {
        Article memory article = articles[_pid];
        return (article.name, article.point, article.num, article.imgPaths, article.seller);
    }

    function buyArticle(uint256 _pid, uint256 _timestamp) public {
        require(articles[_pid].num > 0, "Product is sold out");

        Article storage article = articles[_pid];
        address _buyer = msg.sender;
        token.transfer(article.seller, _buyer, article.point);

        article.num -= 1;

        buying[_pid].push(_buyer);
        emit BuyArticle(_pid, _buyer, _timestamp);
        // emit AddedActivity(_pid, _buyer, _timestamp);
    }
}
