$(document).ready( () =>{
    
    var alphabet = ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 
    'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z'];

    $(document).on('click', '#submEncBtn', () => {
        
        var noEncT = $('#textAre').val().toLowerCase();
        var encT = '';
        var numDesE = $('#numDesEnc').val();
        numDesE = parseInt(numDesE);

        for (var i of noEncT){
            if (i == ' ' || i == 'ñ'){
                encT = encT.concat(' ')
                
            }else{
                var j = i;
                var ind = alphabet.indexOf(j);
                var newInd = alphabet.indexOf(j) + numDesE;
                if(ind == -1){
                    encT = encT.concat(i);
                }else{
                    if(ind > alphabet.length){
                        encT = encT.concat(alphabet[(newInd-alphabet.length)]);
                            
                    }else{
                        encT = encT.concat(alphabet[newInd]);
                            
                    }
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
                if(alphabet.indexOf(s) == -1){
                    textDec = textDec.concat(s);
                }else{
                    if(indD < 0){
                        var newIndD = indD + (alphabet.length -1);
                        textDec = textDec.concat(alphabet[newIndD]);
                    }else{
                        textDec = textDec.concat(alphabet[indD]);
                    }
                }
                }
                
        }
        $('#resultDec').text(textDec);
    });

    
});


