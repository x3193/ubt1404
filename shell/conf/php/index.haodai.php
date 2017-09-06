<?php

//-----------------------------------

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

function getip()
{
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

//-----------------------------------

set_time_limit(0); //设置超时时间
define('APP_NAME', 'App');//定义项目名称
define('APP_PATH', './');//定义项目路径
//====配置开始====
define( "HD_REF" , 'hd_1103184' ); //好贷联盟推广码 //好贷开放平台获取
define( "HD_AKEY" , '1011408' ); // App Key //好贷开放平台获取
define( "HD_SKEY" , 'dnymOT1bvZ6c77OiGrVfYsCDjvXJTSPm' ); // App Secret //好贷开放平台获取
define( "HD_CALLBACK_URL" , 'http://hd.x3193.usa.cc/?s=/Callback/index' ); // 认证回调地址
define( "DF_CITY" , 'beijing' ); //默认城市（拼音），必须是好贷官方开通的城市（请查看：http://yun.haodai.com/lianmeng/api/index/title/city）
//====配置结束====
define( "HD_API_HOST" , "http://api.haodai.com/");// 认证地址不需要修改
define( "APP_DEBUG" ,FALSE); //开启调试模式
define( "XDQ_API_HOST" , "interface.api.haodai.com");// 信贷圈地址不需要修改
//入口文件
require('ThinkPHP/ThinkPHP.php'); ?>