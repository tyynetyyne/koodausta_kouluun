
var translations = {
    "On this page:" : "Tällä sivulla:",
    "procedure" : "funktio",
	"syntax" : "syntaksi",
	"prev" : "taakse",
	"next" : "eteen",
	"up" : "ylös",
	"Examples" : "Esimerkit"
}

var translate_class_names = ["tocsubtitle",
                             "RBackgroundLabelInner"];

AddOnLoad(function() {
    for (var j = 0; j < translate_class_names.length; j++) {
        elems = document.getElementsByClassName(translate_class_names[j]);
        for (var i = 0; i < elems.length; i++) {
            var elem = elems.item(i);
            var new_text = translations[elem.textContent];
            if (new_text)
                elem.textContent = new_text;
        }
    }
})

