<?php
$f3 = require('fatfree-master/lib/base.php');

$f3->config('config.ini');
$f3->config('routes.ini');

class Main {

    function hello(){
          echo 'Hola como estay???';
    }

    function greeting($f3){
          echo 'Hello '.$f3->get('PARAMS.name').', nice to meet you';
    }

    function readfile($f3){
          $file_handle = fopen($f3->get('PARAMS.filepath'), "r");
          while (!feof($file_handle)) {
            $line = fgets($file_handle);
            echo $line;
          }
          fclose($file_handle);
    }

    function render($f3){
		    $f3->set('name','world');
        $template=new Template;
        echo $template->render('template.htm');
    }
}

$f3->route('GET /antonia',
    function() {
        echo 'Que tengas un buen dia!!!';
    }
);
$f3->route('GET /pubg',
    function() {
        echo 'PUBG en la noche cabros!!!';
    }
);
$f3->run();
?>
