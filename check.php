<!DOCTYPE html>
<html lang="en">
<head>
<title>Webhost/Database Compatibility Test</title>

<?php
if (isset($_POST['username']) && !$_POST['username'] == null && isset($_POST['db']) && !$_POST['db'] == null && isset($_POST['server']) && !$_POST['server'] == null) {
	$servername = $_POST['server'];
	$username = $_POST['username'];
	$password = $_POST['password'];
	$db = $_POST['db'];

	$php_ok = (function_exists('version_compare') && version_compare(phpversion(), '7.4.0', '>='));
	$php8_ok = (function_exists('version_compare') && version_compare(phpversion(), '8.0.0', '>='));
	$mysqli_ok = (function_exists('mysqli_connect'));
	$openssl_ok = extension_loaded('openssl');
	$db_conn = false;

	if ($mysqli_ok) {
		try {
			$conn = new PDO("mysql:host=$servername;dbname=$db", $username, $password);
			$conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
			$db_conn = true;
		} catch (PDOException $e) {
			$db_conn = 'Connection failed: ' . $e->getMessage();
		}
	}

	header('Content-type: text/html; charset=UTF-8');
?>

<style type="text/css">
body {
    font:14px/1.4em "Lucida Grande", Verdana, Arial, Helvetica, Clean, Sans, sans-serif;
    letter-spacing:0px;
    color:#333;
    margin:0;
    padding:0;
    background:#fff;
}
div#site {
    width:550px;
    margin:20px auto 0 auto;
}
a {
    color:#000;
    text-decoration:underline;
    padding:0 1px;
}
a:hover {
    color:#fff;
    background-color:#333;
    text-decoration:none;
    padding:0 1px;
}
p {
    margin:0;
    padding:5px 0;
}
em {
    font-style:normal;
    background-color:#ffc;
    padding: 0.1em 0;
}
.success {
  background-color: lightgreen;
}
.highlight {
  background-color: #ffc;
}
ul, ol {
    margin:10px 0 10px 20px;
    padding:0 0 0 15px;
}
ul li, ol li {
    margin:0 0 7px 0;
    padding:0 0 0 3px;
}
h2 {
    font-size:18px;
    padding:0;
    margin:30px 0 20px 0;
}
h3 {
    font-size:16px;
    padding:0;
    margin:20px 0 5px 0;
}
h4 {
    font-size:14px;
    padding:0;
    margin:15px 0 5px 0;
}
code {
    font-size:1.1em;
    color:#000;
}
em strong {
    text-transform: uppercase;
}
table.chart {
    border-collapse:collapse;
}
table.chart th {
    background-color:#eee;
    padding:2px 3px;
    border:1px solid #fff;
}
table.chart td {
    text-align:center;
    padding:2px 3px;
    border:1px solid #eee;
}
table.chart tr.enabled td {
    /* Leave this alone */
}
table.chart tr.disabled td, 
table.chart tr.disabled td a {
    color:#999;
    font-style:italic;
}
table.chart tr.disabled td a {
    text-decoration:underline;
}
div.chunk {
    margin:20px 0 0 0;
    padding:0 0 10px 0;
    border-bottom:1px solid #ccc;
}
.footnote,
.footnote a {
    font:10px/12px verdana, sans-serif;
    color:#aaa;
}
.footnote em {
    background-color:transparent;
    font-style:italic;
}
</style>

</head>

<body>

<div id="site">
    <div id="content">

        <div class="chunk">
            <h2 style="text-align:center;">Webhost/Database Compatibility Test</h2>
            <table cellpadding="0" cellspacing="0" border="0" width="100%" class="chart">
                <thead>
                    <tr>
                        <th>Test</th>
                        <th>Should Be</th>
                        <th>What You Have</th>
                    </tr>
                </thead>
                <tbody>
                    <tr class="<?php
	echo ($php_ok) ? 'enabled' : 'disabled';
?>">
                        <td>PHP</td>
                        <td>7.4.0 or higher</td>
                        <td><?php
	echo phpversion();
?></td>
                    </tr>
                    <tr class="<?php
	echo ($php8_ok) ? 'enabled' : 'disabled';
?>">
                        <td>PHP</td>
                        <td>8.0.0 or higher</td>
                        <td><?php
	echo phpversion();
?></td>
                    </tr>
                    <tr class="<?php
	echo ($mysqli_ok) ? 'enabled' : 'disabled';
?>">
                        <td>MySQLi Extension</td>
                        <td>Enabled</td>
                        <td><?php
	echo ($mysqli_ok) ? 'Enabled' : 'Disabled';
?></td>
                    </tr>
                    <tr class="<?php
	echo ($db_conn === true) ? 'enabled' : 'disabled';
?>">
                        <td>Database connection</td>
                        <td>Success</td>
                        <td><?php
	echo ($db_conn === true) ? 'Success' : 'Failed';
?></td>
                    </tr>
                    <tr class="<?php
	echo ($openssl_ok) ? 'enabled' : 'disabled';
?>">
                        <td>openssl</td>
                        <td>Enabled</td>
                        <td><?php
	echo ($openssl_ok) ? 'Enabled' : 'Disabled';
?></td>
                    </tr>                    
                </tbody>
            </table>
        </div>
        
        <div class="chunk">
            <h3>What does this mean?</h3>
            <?php
			if ($php_ok && $mysqli_ok && $openssl_ok && $db_conn === true):
			?>
               <p style="color: green">Cerintele minime sunt indeplinite pentru un panou ce ruleaza pe versiunea 7.4 PHP!</p>
            <?php
			else:
					?>
               <i style="color: red">Atentie! Cerintele minime nu au fost indeplinite! Analizeaza mai sus problemele si rezolva-le inainte de face achizitionarea! :(</i>
                <?php
				if ($db_conn !== true) {
					echo '<h5>Database connection test result:</h5>' . $db_conn;
				}
						?>
           <?php
			endif;
		?>
           
            <?php
			if ($php8_ok === false):
			?>
               <p style="color: red">In cazul in care doresti sa cumperi un panou ce ruleaza pe versiunea 8.0 PHP, acesta nu va functiona pana nu vei face update la PHP!</p>
            <?php
			endif;
					?>
           <p class="footnote">Date: <?php
	echo date('Y-m-d');
?></p>
        </div>
    </div>

</div>
<?php
} else {
?>

<center>
<form method="post">
    <h5>Database connection</h5>
    <input type="text" name="server" placeholder="server_ip"/>
    <input type="text" name="username" placeholder="db_user"/>
    <input type="text" name="password" placeholder="db_user_password"/>
    <input type="text" name="db" placeholder="db_name"/><br><br>
    <button type="submit">Test connection</button><br><br><br>
    <h4>Website: <a href="https://aquahosting.ro/">https://aquahosting.ro/</a></h4>
    <h4>Discord: discord.gg/aquahosting</h4>
</form>
</center>

<?php
}
?>
</body>
</html>