<!DOCTYPE html>
<html >
<head>
  <meta charset="UTF-8">
  <title>Leave an impression</title>
    <link rel="stylesheet" href="css/style.css">  
</head>

<body style="background:#f9f9f9 url(bg.jpg) repeat left top; ">
  <div class="login-wrap">
	<div class="login-html">
		<input id="tab-1" type="radio" name="tab" class="sign-in" checked><label for="tab-1" class="tab">Sign In</label>
		<input id="tab-2" type="radio" name="tab" class="sign-up"><label for="tab-2" class="tab">Sign Up</label>
		<div class="login-form">
			<div class="sign-in-htm">
			<form name='login' action=signin.jsp >
				<div class="group">
					<label for="user" class="label">Username</label>
					<input id="user" name="username" type="text" class="input">
				</div>
				<div class="group">
					<label for="pass" class="label">Password</label>
					<input id="pass" name="password" type="password" class="input" data-type="password">
				</div>
				<div class="group">
					<input id="check" type="checkbox" class="check" checked>
					<label for="check"><span class="icon"></span> Keep me Signed in</label>
				</div>
				<div class="group">
					<input type="submit" class="button" value="Sign In">
				</div>
				<div class="hr"></div>
				</form>
			</div>
			<div class="sign-up-htm">
				<form name='registration' action=signup.jsp >
				<div class="group">
					<label for="user" class="label">Username</label>
					<input id="username" name="username" type="text" class="input">
				</div>
				<div class="group">
					<label for="pass" class="label">Password</label>
					<input id="password" name="password" type="password" class="input" data-type="password">
				</div>
				<div class="group">
					<label for="pass" class="label">Repeat Password</label>
					<input id="pass" type="password" class="input" data-type="password">
				</div>
				<div class="group">
					<label for="pass" class="label">Email Address</label>
					<input id="email" name="email" type="text" class="input">
				</div>
				<div class="group">
					<input type="submit" class="button" value="Sign Up">
				</div>
				<div class="hr"></div>
				<div class="foot-lnk">
									<label for="tab-1">Already Member?</a>
				</div>
				</form>
			</div>
		
		</div>
	</div>
</div>
    
</body>
</html>
