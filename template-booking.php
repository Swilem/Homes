<?php
/**
 * Template Name: booking-template
 *
 
 */
?>

<!DOCTYPE html>
<!--[if lt IE 7]>
<html class="ie ie-no-support" <?php language_attributes(); ?>> <![endif]-->
<!--[if IE 7]>
<html class="ie ie7" <?php language_attributes(); ?>> <![endif]-->
<!--[if IE 8]>
<html class="ie ie8" <?php language_attributes(); ?>> <![endif]-->
<!--[if IE 9]>
<html class="ie ie9" <?php language_attributes(); ?>> <![endif]-->
<!--[if gt IE 9]><!-->
<html <?php language_attributes(); ?>> <!--<![endif]-->
<head>
    <meta charset="<?php bloginfo( 'charset' ); ?>"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <!--<title><?php wp_title(); ?></title>-->
    <title>Apartment Selector - Manas Lake</title>
    <link rel="shortcut icon" href="../wp-content/themes/Homes/images/favicon.png" />
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!--[if lt IE 9]>
    <script src="<?php echo get_template_directory_uri(); ?>/js/html5shiv.js"></script>

    <![endif]-->

  <script type="text/javascript">

   
  
 
    var unit_id = localStorage.getItem('unit_id');
    var unit_name = localStorage.getItem('unit_name');
    var finalcost = localStorage.getItem('finalcost');
    var recAmount = localStorage.getItem('recAmount');
    var building = localStorage.getItem('building');

  

  

    </script>

    <?php wp_head(); ?>
     
</head>

<body class="booking cbp-spmenu-push">

  <!-- #header-region -->
<div id="header-region"></div>

<!-- filter-region -->
<div id="filter-region"></div>

<!-- main-region -->
<div id="main-region"></div>
<div id="wishlist-region"></div>

<!-- footer-region -->
<div id="footer-region">



</div>














<script>
  (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
  })(window,document,'script','//www.google-analytics.com/analytics.js','ga');

  ga('create', 'UA-55969484-1', 'auto');
  ga('send', 'pageview');

</script>

<?php wp_footer(); ?>
</body>
</html>