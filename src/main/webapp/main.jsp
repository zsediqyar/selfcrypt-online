<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="description" content="Texy Encryption Made Easy">
        <meta name="keywords" content="Privacy, Encryption, Ciphers">
        <meta name="author" content="Zaki Sediqyar">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <!-- BOOTSTRAP CDN -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
        <!-- MANAUL CSS FILE-->
        <link rel="stylesheet" href="web-inf/assets/css/main.css">
        <title>SELFCRYPT - Text Encryption Made Easy!</title>
        
        <script>
		window.onload = function () {
				var name = document.getElementById("name");
				if(name.innerHTML == "null") {
					name.style.color = "red";
					name.innerHTML = "";
					
				}
			}
		</script>
    </head>
    <body>
        
        
<!--  EMBEDDING JAVA -->
<%!
	class Cipher {
		private char [] key = new char[2];
		
		public void setKey(char k[]) {
			for(int i = 0; i < 2; i++) {
				key[i] = k[i];
			}
		}
		
		public String crypt(String toCipher) {
			StringBuilder result = new StringBuilder();
			for(int i = 0; i < toCipher.length(); i++) {
				result.append((char) (toCipher.charAt(i) ^ key[i % key.length]));
			}
			return result.toString();
		}
		
	};
%>

<%
	char [] keyArray = new char[2];
	String keyInput;
	String textInput;
	String result = "";
	
	Cipher cipher = new Cipher();
	
	
	//GET THE KEY FROM THE FORM
	keyInput = request.getParameter("key");
	//GET THE TEXT FROM THE FORM
	textInput = request.getParameter("body");
	
	//PUSH KEY STRING TO CHAR ARRAY
	try {
		for(int i = 0; i < keyInput.length(); i++) {
			keyArray[i] = keyInput.charAt(i);
		}
	} catch(NullPointerException e) {
		System.out.println("caught");
	}
	//SET THE CHAR ARRAY OF THE CLASS FROM THE LOCAL CHAR ARRAY
	cipher.setKey(keyArray);
	//PROCESS THE TEXT AND SAVE IT TO RESULT
	try {
		result = cipher.crypt(textInput);
	} catch(NullPointerException e) {
		System.out.println("caught");
	}
	
	System.out.println(textInput);
%>

   <div class="container">
       <div class="row">
            <div class="col-md-12">
                <div class="desc-box">
                    <h2 class="desc-title">selfcrypt</h2>
                    <h3 class="desc-subtitle">Description</h3>
                    <p class="desc-desc">You can use this program to Encrypt or Decrypt your text files. You can either store it back in a file or send it via an email, safe and secure.</p>

                    <h4 class="desc-list-title">HOW TO:</h4>
                    <ul >
                        <li>- Select a 'KEY' this needs to be a two character key, like your initials.</li>
                        <li>- Write your text in the box below and click 'CRYPT'.</li>
                        <li>- The Encrypted text will display below. You can copy it and either save it in a file or use it directly in any program you want</li>
                        <li>- To Decrypt or Decipher the text. You can copy the encrypted text in the box, enter the same key and click Crypt. It will decipher the text.</li>
                        <li>- Since this is the SYMMETERIC approach to Encryption, you need the same key to Decrypt the cipher text.</li>
                    </ul>
                </div>
            </div>
       </div>
       <div class="row">
           <div class="col-md-12">
               <div class="form-box">
                    <form action="main.jsp" method="POST">
                        <div class="form-group">
                            <input type="password" class="form-control" placeholder="Enter Key" required name="key">
                        </div>
                        <div class="form-group">
                                <textarea cols="30" rows="5" placeholder="Enter your text here to process" class="form-control" name="body">
                                </textarea>
                        </div>
                        <div class="btn-div">
                        	<button type="submit" class="crypt-button">crypt</button>
                    	</div>
                    </form>
                </div>
           </div>
       </div>
   </div>
   <div class="container-fluid process">
       <div class="container">
            <div class="row">
                    <div class="col-md-12">
                         <div class="result-box">
                             <h2 class="result-subtitle">Processed Text <span>(copy it from below)</span></h2>
                             <p class="processed-text"><%= result %></p>
                         </div>
                    </div>
                </div>
       </div>
   </div>




<!-- JAVA CODE FOR TEXT PROCESSING -->

    <!-- BOOTSTRAP REQUIRED JAVASCRIPT -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
    </body>
</html>