let session = require("express-session");
// let cookieParser = require("cookie-parser");
var sess;

const getAllCTHDN = (req, res) => {
  try {
    // sess = req.session;
    let result = sess.CTHDN ? sess.CTHDN : [];
    console.log(result);
    res.status(200).json({
      status: "OK",
      result,
    });
  } catch (err) {
    res.status(404).json({
      status: "Empty CTHDN",
      message: err.message,
    });
  }
};

const selectCTHDN = (req, res) => {
  if (!sess || !sess.CTHDN) {
    sess = req.session;
    sess.CTHDN = [];
  }
  sess.CTHDN.push(req.body);
  const result = sess.CTHDN;
  res.status(200).json({
    status: "success",
    result,
  });
};

const updateCTHDN = (req, res) => {
  try {
    sess = req.session;
    sess.CTHDN.splice(req.params.id, 1, req.body);
    const result = sess.CTHDN;
    res.status(201).json({
      status: "success",
      result,
    });
  } catch (err) {
    res.status(500).json({
      status: "error",
      message: err.message,
    });
  }
};

const deleteCTHDN = (req, res) => {
  // sess = req.session;
  sess.CTHDN.splice(req.params.id, 1);
  res.status(204).json({
    status: "success",
  });
};

const deleteAllCTHDN = (req, res) => {
  sess = req.session;
  sess.CTHDN ? sess.CTHDN.splice(0, sess.CTHDN.length) : sess.CTHDN;
  res.status(204).json({
    status: "success",
  });
};

module.exports = {
  getAllCTHDN,
  selectCTHDN,
  updateCTHDN,
  deleteCTHDN,
  deleteAllCTHDN,
};
