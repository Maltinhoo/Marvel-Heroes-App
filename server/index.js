const express = require("express");
const app = express();

app.use(express.json());

app.listen(3000, () => {
    console.log("Running...");
});

app.post('/login', function (req, res, next) {
    const params = {
        email: req.body.email,
        pass: req.body.pass,
    };
    console.log(params);
    if(req.body.email == 'teste@gmail.com' && req.body.pass == 'teste123'){
        const token = '<TOKEN>';
        return res.status(200).jsonp({token});
    }
    return res.status(401).jsonp({message: "Não autorizado"});
});