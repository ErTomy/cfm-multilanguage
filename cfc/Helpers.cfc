component { 

    public string function translate ( required string key, string language ){

        var translate = '';

        //  en caso de no pasar el idioma cogemos el del navegador por defecto
        if (isNull(language)){
            language = listFirst(listFirst(GetHttpRequestData().headers['Accept-Language']), '-');
        }

        // buscamos la traducción especifica de la aplicación
        jsonPath = ExpandPath('./json/lang_' & language & '.json');
        if (fileExists(jsonPath)){
            json = deserializeJSON(fileread(jsonPath));
            if (structKeyExists(json, key)){
                translate = json[key];
            }               
        }
            
        // si no hay traduccion especifica, buscamos la traducción general        
        if (len(translate) == 0){
            jsonPath = ExpandPath('/json/lang_' & arguments.language & '.json');
            if (fileExists(jsonPath)){
                json = deserializeJSON(fileread(jsonPath));
                if (structKeyExists(json, key)){
                    translate = json[key];
                }
            }                
        }  

        return translate;
    }

}