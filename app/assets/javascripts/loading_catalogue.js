var catalogueProducts = [
  {
    title: "Bearings",
    pic: 'url(/assets/bearing-modal-mini.jpg);',
    bigger_picture: '',
    description: 'bananananaanananananananananaa',
    modal_number: "1"
  },
  {
    title: "Fasteners",
    pic: 'url(/assets/socket-modal-mini.jpg);',
    bigger_picture: '',
    description: 'bananana2',
    modal_number: "2"
  },
  {
    title: "Abrasives",
    pic: 'url(/assets/sait-modal-mini.jpg);',
    bigger_picture: '',
    description: 'bananananaanananananananananaa',
    modal_number: "3"
  },
  {
    title: "Tools",
    pic: 'url(/assets/tool-modal-mini.jpg);',
    bigger_picture: '',
    description: 'bananana2',
    modal_number: "4"
  },
  {
    title: "Electrical",
    pic: 'url(/assets/electrical-modal-mini.jpeg);',
    bigger_picture: '',
    description: 'bananananaanananananananananaa',
    modal_number: "5"
  },
  {
    title: "Motors / Gearbox",
    pic: 'url(/assets/motor-modal-mini.png);',
    bigger_picture: '',
    description: 'bananana2',
    modal_number: "6"
  },
  {
    title: "PPE / Footwear",
    pic: 'url(/assets/ppe-modal-mini.jpg);',
    bigger_picture: '',
    description: 'bananananaanananananananananaa',
    modal_number: "7"
  },
  {
    title: "Tapes / Adhesives",
    pic: 'url(/assets/tape-modal-mini.jpg);',
    bigger_picture: '',
    description: 'bananana2',
    modal_number: "8"
  },
  {
    title: "Chains / Sprocket",
    pic: 'url(/assets/chain-modal-mini.jpeg);',
    bigger_picture: '',
    description: 'bananananaanananananananananaa',
    modal_number: "9"
  },
  {
    title: "Power Tools",
    pic: 'url(/assets/power-modal-mini.jpeg);',
    bigger_picture: '',
    description: 'bananana2',
    modal_number: "10"
  },
  {
    title: "Pneumatics",
    pic: 'url(/assets/pneumatics-modal-mini.jpg);',
    bigger_picture: '',
    description: 'bananananaanananananananananaa',
    modal_number: "11"
  },
  {
    title: "Drilling / Tapping",
    pic: 'url(/assets/tap-modal-mini.jpeg);',
    bigger_picture: '',
    description: 'bananananaanananananananananaa',
    modal_number: "11"
  }
]

document.addEventListener("turbolinks:load", function () {
  for(var i = 0; i < catalogueProducts.length; ++i ) {
    $("#catalogue").append("\
      <div class='col-sm-3 col-6 modal-button-backgrounds' style='background-image:  " + catalogueProducts[i].pic + "  '>\
        <button type='button' class='btn btn-primary' data-toggle='modal' data-target='.bd-example-modal-lg-" + catalogueProducts[i].modal_number +  "'>" + catalogueProducts[i].title + " </button>\
        <div class='modal fade bd-example-modal-lg-" + catalogueProducts[i].modal_number +  "' tabindex='-1' role='dialog' aria-labelledby='myLargeModalLabel' aria-hidden='true'>\
        <div class='modal-dialog modal-lg'>\
          <div class='modal-content'>\
              '" + catalogueProducts[i].description + "'  \
          </div>\
        </div>\
      </div>\
    ");
  };
});
