$(document).ready( () =>{
    
    var alphabet = ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 
    's', 't', 'u', 'v', 'w', 'x', 'y', 'z'];

    $(document).on('click', '#submBtn', () => {
        
        var noEncT = $('#textAre').val().toLowerCase();
        var encT = '';
        var j = 0;
        for ( var i of alphabet){
            if(i == noEncT.charAt(j)){
                var ind = alphabet.indexOf(i) + 3;
                if(ind > alphabet.length){
                    encT = encT.concat(alphabet[(ind-alphabet.length-1)])
                }else{
                    encT = encT.concat(alphabet[ind]);
                }
                j++;
            }else if( noEncT.charAt(j) == ' ' || noEncT.charAt(j) == 'ñ'){
                encT = encT.concat(' ')
                j++;
            }
        }
        $('#result').text(encT);

    });

    
});


