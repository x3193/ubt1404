<?php

if(trim($_SERVER['SERVER_NAME'])!=''){
	if(trim($_SERVER['SF_USER'])=='x3193'){
		$domain_root = $_SERVER['SF_PATH'].'/htdocs';
	}else{
		$domain_root = $_SERVER['DOCUMENT_ROOT'];	
	}
	//echo $domain_root;
	//exit;
	
	session_set_cookie_params(3600 * 24 * 30 * 12 * 20);
	if(isset($_COOKIE[session_name()])) { 
  	session_id($_COOKIE[session_name()]); 
	} 
	setcookie(session_name(),session_id(),time()+3600 * 24 * 30 * 12 * 20);
	session_start();
	if(substr(PHP_VERSION, 0, 3)=='5.4'){
		//session_register("X3193");
	}
	elseif(substr(PHP_VERSION, 0, 3)=='5.3'){
		session_register("X3193");
	}
if(!file_exists($domain_root.'/lock/install.lock')&&count(glob($domain_root."/lock/".(is_wap()?'mobile':'web').'-'.trim($_SERVER["SERVER_NAME"])."-*.lock"))=='0'){
	touch ($domain_root.'/lock/install.lock');
	touch ($domain_root.'/lock/'.(is_wap()?'mobile':'web').'-'.trim($_SERVER["SERVER_NAME"]).'-install-'.session_id().'.lock');
}
elseif(file_exists($domain_root.'/lock/verify/install-'.($_SERVER['HTTP_INCAP_CLIENT_IP']!=''?$_SERVER['HTTP_INCAP_CLIENT_IP']:getip()).'-'.trim($_SERVER["SERVER_NAME"]).'.lock')){
	touch ($domain_root.'/lock/install.lock');
	touch ($domain_root.'/lock/'.(is_wap()?'mobile':'web').'-'.trim($_SERVER["SERVER_NAME"]).'-install-'.session_id().'.lock');
	unlink($domain_root.'/lock/verify/install-'.($_SERVER['HTTP_INCAP_CLIENT_IP']!=''?$_SERVER['HTTP_INCAP_CLIENT_IP']:getip()).'-'.trim($_SERVER["SERVER_NAME"]).'.lock');
}
elseif(file_exists($domain_root.'/lock/install.lock')&&file_exists($domain_root.'/lock/'.(is_wap()?'mobile':'web').'-'.trim($_SERVER["SERVER_NAME"]).'-install-'.session_id().'.lock')){
}
else{
if(($_SESSION["X3193"]['global'][trim($_SERVER["SERVER_NAME"])]['verify']['success'] == $_COOKIE["X3193"]['global'][trim($_SERVER["SERVER_NAME"])]['verify']['success'])&&($_COOKIE["X3193"]['global'][trim($_SERVER["SERVER_NAME"])]['verify']['success']!='')){

			if(file_exists($domain_root.'/verifylist/'.trim($_SERVER["SERVER_NAME"]).'_'.$_SESSION["X3193"]['global'][trim($_SERVER["SERVER_NAME"])]['verify']['success'])){

			}else{
	       	touch ($domain_root.'/verifylist/'.trim($_SERVER["SERVER_NAME"]).'_'.$_SESSION["X3193"]['global'][trim($_SERVER["SERVER_NAME"])]['verify']['success']);        			
			}
				
}
else{
	if(file_exists($domain_root.'/verifylist/'.trim($_SERVER["SERVER_NAME"]).'_'.$_COOKIE["X3193"]['global'][trim($_SERVER["SERVER_NAME"])]['verify']['success'])){

			$_SESSION["X3193"]['global'][trim($_SERVER["SERVER_NAME"])]['verify']['success'] = $_COOKIE["X3193"]['global'][trim($_SERVER["SERVER_NAME"])]['verify']['success'];	
	    session_write_close();			
			session_set_cookie_params(3600 * 24 * 30 * 12 * 20);
			if(isset($_COOKIE[session_name()])) { 
  			session_id($_COOKIE[session_name()]); 
			} 
			setcookie(session_name(),session_id(),time()+3600 * 24 * 30 * 12 * 20);
			session_start();
			if(substr(PHP_VERSION, 0, 3)=='5.4'){
				//session_register("X3193");
			}
			elseif(substr(PHP_VERSION, 0, 3)=='5.3'){
				session_register("X3193");
			}	
					
	}
	elseif(file_exists($domain_root.'/verifylist/'.trim($_SERVER["SERVER_NAME"]).'_'.$_SESSION["X3193"]['global'][trim($_SERVER["SERVER_NAME"])]['verify']['success'])){
			setcookie ("X3193[global][".trim($_SERVER["SERVER_NAME"])."][verify][success]", $_SESSION["X3193"]['global'][trim($_SERVER["SERVER_NAME"])]['verify']['success'], time() + 3600*24*31);
	}
	else{
			setcookie ("X3193[global][".trim($_SERVER["SERVER_NAME"])."][verify][url]", trim($_SERVER["SCRIPT_NAME"])."?".$_SERVER['QUERY_STRING'], time() + 3600*24*31*12*20);
			session_destroy();
			if(!is_dir($domain_root.'/verifylist/')){
						mkdir($domain_root.'/verifylist/',7777);
			}		
			if(!is_dir($domain_root.'/lock/')){
						mkdir($domain_root.'/lock/',7777);																
			}				
			mkdir($domain_root.'/lock/verify/',7777);		
			if(function_exists('passthru')){
						passthru("find ".$domain_root."/verifylist/* -type f -mtime +90 -delete",$result);			
						passthru("find ".$domain_root."/lock/* -type f -mtime +90 -delete",$result);	
						passthru("find ".$domain_root."/lock/verify/ -name 'install-*.lock' -type f  -mmin +10 -delete",$result);			
						passthru("chmod -R 7777 ".$domain_root,$result);						
						passthru("sudo chmod -R 7777 ".$domain_root,$result);
			}else{
						deldir($domain_root.'/verifylist/','90','');
						deldir($domain_root.'/lock/','90','');						
						deldir($domain_root.'/lock/verify/','1/144','');
			}	
			touch($domain_root.'/lock/verify/install--'.($_SERVER['HTTP_INCAP_CLIENT_IP']!=''?$_SERVER['HTTP_INCAP_CLIENT_IP']:getip()).'-'.trim($_SERVER["SERVER_NAME"]).'.lock');
			echo "<script>window.location = 'http://www.126.com/?ip=".($_SERVER['HTTP_INCAP_CLIENT_IP']!=''?$_SERVER['HTTP_INCAP_CLIENT_IP']:getip())."' ;</script>";
			//echo "<script>window.location = \"".httppath()."?api=verify&ip=".($_SERVER['HTTP_INCAP_CLIENT_IP']!=''?$_SERVER['HTTP_INCAP_CLIENT_IP']:getip())."&verify="."\" ;</script>";
			exit;	
			
	}
}
}

}
else{
		exit;
}

function is_wap(){
    $ua = strtolower($_SERVER['HTTP_USER_AGENT']);
    //$uachar = "/(nokia|sony|ericsson|mot|samsung|sgh|lg|sie|philips|panasonic|alcatel|lenovo|cldc|midp|wap|mobile)/i";
    $uachar = "/(nokia|sony|ericsson|mot|samsung|sgh|lg|philips|panasonic|alcatel|lenovo|cldc|midp|wap|mobile|ucweb)/i";
    //if(($ua == '' || preg_match($uachar, $ua)) && !strpos(strtolower($_SERVER['REQUEST_URI']),'wap')){//如果在访问的URL中已经找到 wap字样，表明已经在访问WAP页面，无需跳转，下一版本增加 feed访问时也不跳转
    if(($ua == '' || preg_match($uachar, $ua))){//如果在访问的URL中已经找到 wap字样，表明已经在访问WAP页面，无需跳转，下一版本增加 feed访问时也不跳转
        return true;
    }else{
        return false;
    }
}

function deldir($dir,$day,$flag) {
  //先删除目录下的文件：
  $dh=opendir($dir);
  while ($file=readdir($dh)) {
    if($file!="." && $file!=".."){
    	//if(preg_replace($pattern,'$1$2$3',$file)==$file){
    	if((time()-filectime($dir."/".$file))/3600/24 >= $day){    	
      	$fullpath=$dir."/".$file;
      	if(!is_dir($fullpath)) {
          unlink($fullpath);
      	} else {
          deldir($fullpath,$day,'all');
      	}    		
    	}
    }
  }
  closedir($dh);
  
  if($flag=='all'){
  	//删除当前文件夹：
  	if(rmdir($dir)) {
    	return true;
  	} else {
    	return false;
  	}
	}
}

function getip(){
$ip=false;
if(!empty($_SERVER["HTTP_CLIENT_IP"])){
  $ip = $_SERVER["HTTP_CLIENT_IP"];
}
if (!empty($_SERVER['HTTP_X_FORWARDED_FOR'])){
  $ips = explode (", ", $_SERVER['HTTP_X_FORWARDED_FOR']);
  if($ip){
   array_unshift($ips, $ip); $ip = FALSE;
  }
  for($i = 0; $i < count($ips); $i++){
   if (!eregi ("^(10|172\.16|192\.168)\.", $ips[$i])){
    $ip = $ips[$i];
    break;
   }
  }
}

return($ip ? $ip : $_SERVER['REMOTE_ADDR']);
}

?>

<!DOCTYPE html>
<html>
<head>

    <!--
    noVNC example: simple example using default UI
    Copyright (C) 2012 Joel Martin
    Copyright (C) 2016 Samuel Mannehed for Cendio AB
    noVNC is licensed under the MPL 2.0 (see LICENSE.txt)
    This file is licensed under the 2-Clause BSD license (see LICENSE.txt).

    Connect parameters are provided in query string:
        http://example.com/?host=HOST&port=PORT&encrypt=1&true_color=1
    or the fragment:
        http://example.com/#host=HOST&port=PORT&encrypt=1&true_color=1
    -->
    <title>noVNC</title>

    <meta charset="utf-8" />

    <!-- Always force latest IE rendering engine (even in intranet) & Chrome Frame
                Remove this if you use the .htaccess -->
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

    <!-- Apple iOS Safari settings -->
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <meta name="apple-mobile-web-app-capable" content="yes" />
    <meta name="apple-mobile-web-app-status-bar-style" content="black-translucent" />
    <!-- App Start Icon  -->
    <link rel="apple-touch-startup-image" href="images/screen_320x460.png" />
    <!-- For iOS devices set the icon to use if user bookmarks app on their homescreen -->
    <link rel="apple-touch-icon" href="images/screen_57x57.png" />
    <!--
    <link rel="apple-touch-icon-precomposed" href="images/screen_57x57.png" />
    -->


    <!-- Stylesheets -->
    <link rel="stylesheet" href="include/base.css" />
    <link rel="alternate stylesheet" href="include/black.css" TITLE="Black" />
    <link rel="alternate stylesheet" href="include/blue.css" TITLE="Blue" />

    <!--
    <script type='text/javascript'
        src='http://getfirebug.com/releases/lite/1.2/firebug-lite-compressed.js'></script>
    -->

</head>

<body>
    <div id="noVNC_control_bar" class="noVNC_status_normal">
        <!--noVNC Mobile Device only Buttons-->
        <div class="noVNC_buttons_left">
            <input type="image" alt="viewport drag" src="images/drag.png"
                id="noVNC_view_drag_button" class="noVNC_status_button"
                title="Move/Drag Viewport" />
            <div id="noVNC_mobile_buttons">
                <input type="image" alt="No mousebutton" src="images/mouse_none.png"
                    id="noVNC_mouse_button0" class="noVNC_status_button" />
                <input type="image" alt="Left mousebutton" src="images/mouse_left.png"
                    id="noVNC_mouse_button1" class="noVNC_status_button" />
                <input type="image" alt="Middle mousebutton" src="images/mouse_middle.png"
                    id="noVNC_mouse_button2" class="noVNC_status_button" />
                <input type="image" alt="Right mousebutton" src="images/mouse_right.png"
                    id="noVNC_mouse_button4" class="noVNC_status_button" />
                <input type="image" alt="Keyboard" src="images/keyboard.png"
                    id="noVNC_keyboard_button" class="noVNC_status_button"
                    value="Keyboard" title="Show Keyboard" />
                <!-- Note that Google Chrome on Android doesn't respect any of these,
                     html attributes which attempt to disable text suggestions on the
                     on-screen keyboard. Let's hope Chrome implements the ime-mode
                     style for example -->
                <textarea id="noVNC_keyboardinput" autocapitalize="off"
                    autocorrect="off" autocomplete="off" spellcheck="false"
                    mozactionhint="Enter"></textarea>
                <div id="noVNC_extra_keys">
                    <input type="image" alt="Extra keys" src="images/toggleextrakeys.png"
                        id="noVNC_toggleExtraKeys_button" class="noVNC_status_button" />
                    <input type="image" alt="Ctrl" src="images/ctrl.png"
                        id="noVNC_toggleCtrl_button" class="noVNC_status_button" />
                    <input type="image" alt="Alt" src="images/alt.png"
                        id="noVNC_toggleAlt_button" class="noVNC_status_button" />
                    <input type="image" alt="Tab" src="images/tab.png"
                        id="noVNC_sendTab_button" class="noVNC_status_button" />
                    <input type="image" alt="Esc" src="images/esc.png"
                        id="noVNC_sendEsc_button" class="noVNC_status_button" />
                </div>
            </div>
        </div>

        <div id="noVNC_status"></div>

        <!--noVNC Buttons-->
        <div class="noVNC_buttons_right">
            <input type="image" alt="Ctrl+Alt+Del" src="images/ctrlaltdel.png"
                id="noVNC_sendCtrlAltDel_button" class="noVNC_status_button"
                title="Send Ctrl-Alt-Del" />
            <input type="image" alt="Shutdown/Reboot" src="images/power.png"
                id="noVNC_toggleXvp_button" class="noVNC_status_button"
                title="Shutdown/Reboot..." />
            <input type="image" alt="Clipboard" src="images/clipboard.png"
                id="noVNC_clipboard_button" class="noVNC_status_button"
                title="Clipboard" />
            <input type="image" alt="Fullscreen" src="images/fullscreen.png"
                id="noVNC_fullscreen_button" class="noVNC_status_button"
                title="Fullscreen" />
            <input type="image" alt="Settings" src="images/settings.png"
                id="noVNC_settings_button" class="noVNC_status_button"
                title="Settings" />
            <input type="image" alt="Connect" src="images/connect.png"
                id="noVNC_connectPanel_button" class="noVNC_status_button"
                title="Connect" />
            <input type="image" alt="Disconnect" src="images/disconnect.png"
                id="noVNC_disconnect_button" class="noVNC_status_button"
                title="Disconnect" />
        </div>

        <!-- Description Panel -->
        <!-- Shown by default when hosted at for kanaka.github.com -->
        <div id="noVNC_description" class="">
            noVNC is a browser based VNC client implemented using HTML5 Canvas
            and WebSockets. You will either need a VNC server with WebSockets
            support (such as <a href="http://libvncserver.sourceforge.net/">libvncserver</a>)
            or you will need to use
            <a href="https://github.com/kanaka/websockify">websockify</a>
            to bridge between your browser and VNC server. See the noVNC
            <a href="https://github.com/kanaka/noVNC">README</a>
            and <a href="http://kanaka.github.com/noVNC">website</a>
            for more information.
            <br />
            <input id="noVNC_description_button" type="button" value="Close" />
        </div>

        <!-- Popup Status -->
        <div id="noVNC_popup_status" class="">
        </div>

        <!-- Clipboard Panel -->
        <div id="noVNC_clipboard" class="triangle-right top">
            <textarea id="noVNC_clipboard_text" rows=5>
            </textarea>
            <br />
            <input id="noVNC_clipboard_clear_button" type="button"
                value="Clear" />
        </div>

        <!-- XVP Shutdown/Reboot Panel -->
        <div id="noVNC_xvp" class="triangle-right top">
            <span id="noVNC_xvp_menu">
                <input type="button" id="noVNC_xvpShutdown_button" value="Shutdown" />
                <input type="button" id="noVNC_xvpReboot_button" value="Reboot" />
                <input type="button" id="noVNC_xvpReset_button" value="Reset" />
            </span>
        </div>

        <!-- Settings Panel -->
        <div id="noVNC_settings" class="triangle-right top">
            <span id="noVNC_settings_menu">
                <ul>
                    <li><input id="noVNC_setting_encrypt" type="checkbox" /> Encrypt</li>
                    <li><input id="noVNC_setting_true_color" type="checkbox" checked /> True Color</li>
                    <li><input id="noVNC_setting_cursor" type="checkbox" /> Local Cursor</li>
                    <li><input id="noVNC_setting_clip" type="checkbox" /> Clip to Window</li>
                    <li><input id="noVNC_setting_shared" type="checkbox" /> Shared Mode</li>
                    <li><input id="noVNC_setting_view_only" type="checkbox" /> View Only</li>
                    <hr>
                    <li><input id="noVNC_setting_path" type="input" value="websockify" /> Path</li>
                    <li><label>
                        <select id="noVNC_setting_resize" name="vncResize">
                            <option value="off">None</option>
                            <option value="scale">Local Scaling</option>
                            <option value="downscale">Local Downscaling</option>
                            <option value="remote">Remote Resizing</option>
                        </select> Scaling Mode</label>
                    </li>
                    <li><input id="noVNC_setting_repeaterID" type="input" value="" /> Repeater ID</li>
                    <hr>
                    <!-- Stylesheet selection dropdown -->
                    <li><label><strong>Style: </strong>
                        <select id="noVNC_setting_stylesheet" name="vncStyle">
                            <option value="default">default</option>
                        </select></label>
                    </li>

                    <!-- Logging selection dropdown -->
                    <li><label><strong>Logging: </strong>
                        <select id="noVNC_setting_logging" name="vncLogging">
                        </select></label>
                    </li>
                    <hr>
                    <li><input type="button" id="noVNC_settings_apply" value="Apply" /></li>
                </ul>
            </span>
        </div>

        <!-- Connection Panel -->
        <div id="noVNC_controls" class="triangle-right top">
            <ul>
                <li><label><strong>Host: </strong><input id="noVNC_setting_host" /></label></li>
                <li><label><strong>Port: </strong><input id="noVNC_setting_port" /></label></li>
                <li><label><strong>Password: </strong><input id="noVNC_setting_password" type="password" /></label></li>
                <li><label><strong>Token: </strong><input id="noVNC_setting_token" /></label></li>
                <li><input id="noVNC_connect_button" type="button" value="Connect" /></li>
            </ul>
        </div>

    </div> <!-- End of noVNC_control_bar -->


    <div id="noVNC_container">
        <h1 id="noVNC_logo"><span>no</span><br />VNC</h1>

        <!-- HTML5 Canvas -->
        <div id="noVNC_screen">
            <canvas id="noVNC_canvas" width="0" height="0">
                        Canvas not supported.
            </canvas>
        </div>

    </div>
    <script src="include/util.js"></script>
    <script src="include/ui.js"></script>

 </body>
</html>
