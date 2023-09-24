$(document).ready( () =>{
    
    var alphabet = ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 
    'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z'];

    $(document).on('click', '#submEncBtn', () => {
        
        var noEncT = $('#textAre').val().toLowerCase();
        var encT = '';
        
        for (var i of noEncT){
            if (i == ' ' || i == 'ñ'){
                encT = encT.concat(' ')
                
            }else{
                var j = i;
                var ind = alphabet.indexOf(j)+3;
                if(ind > alphabet.length){
                    encT = encT.concat(alphabet[(ind-alphabet.length)]);
                        
                }else{
                    encT = encT.concat(alphabet[ind]);
                        
                }
                
            }
        };
        $('#resultEnc').text(encT);

    });
    $(document).on('click', '#submDecBtn', () => {
        var textEnc = $('#textEncAre').val().toLowerCase();
        var textDec = '';
        var numDes = $('#numDes').val();

        for(var t of textEnc){
            if(t == ' '){
                textDec = textDec.concat(' ');
            }else{
                var s = t;
                var indD = alphabet.indexOf(s)-numDes;
                if(indD < 0){
                    var newInd = indD + 26;
                    textDec = textDec.concat(alphabet[newInd]);
                }else{
                    textDec = textDec.concat(alphabet[indD]);
                }
            }
        }
        $('#resultDec').text(textDec);
    });

    
});


