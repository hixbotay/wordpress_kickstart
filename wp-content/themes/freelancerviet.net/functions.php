<?php

//using clasic editor 
add_filter('use_block_editor_for_post', '__return_false');
//add shortcode
if(!defined('HBPRO_THEME_PATH')) define('HBPRO_THEME_PATH', (__DIR__));
//shortcode
foreach (glob(HBPRO_THEME_PATH.'/shortcodes/*.php') as $filename)
{
	require_once $filename;
}
//script
add_action( 'wp_enqueue_scripts', 'hbpro_scripts' );
function hbpro_scripts() {
	$root = get_stylesheet_directory_uri();	
	wp_enqueue_style( 'fontawesome', $root.'/css/fontawesome.min.css');
	wp_enqueue_style( 'fontawesome-light', $root.'/css/font-awesome-light.css');
	
}
//SEO
add_action( 'wp_head', 'theme_xyz_header_metadata' );
function theme_xyz_header_metadata(){
	global $post;
	/*
	if(is_home()){	
		$title = get_option('blogname');
		$desc = get_option('blogdescription');
	}else{	
		
	}
	*/
	$metas = get_post_meta($post->ID);
	$title = $metas['page_title'][0] ? $metas['page_title'][0] : $post->post_title;
	$desc = $metas['page_description'][0] ? $metas['page_description'][0] : $post->post_excerpt;
	$thumb_id = get_post_thumbnail_id();
	//echo ($thumb_id);die;
	if($thumb_id){
		$thumb_url_array = wp_get_attachment_image_src($thumb_id, 'thumbnail', true);
		$thumb_url = $thumb_url_array[0];
	}else{
		$thumb_url = flatsome_option('site_logo');
	}	
	
	echo '<meta property="og:locale" content="'.get_locale().'" />'.PHP_EOL;
	echo '<meta property="og:type" content="article" />'.PHP_EOL;
	echo '<meta property="og:title" content="'.$title.'" />'.PHP_EOL;
	echo '<meta property="og:description" content="'.$desc.'" />'.PHP_EOL;
	echo '<meta property="og:site_name" content="'.home_url().'" />'.PHP_EOL;
	echo '<meta property="og:image" content="'.$thumb_url.'" />'.PHP_EOL;
	echo '<meta name="twitter:card" content="summary" />'.PHP_EOL;
	echo '<meta name="twitter:description" content="'.$desc.'" />'.PHP_EOL;
	echo '<meta name="twitter:title" content="'.$title.'" />'.PHP_EOL;
	echo '<meta name="twitter:image" content="'.$thumb_url.'" />'.PHP_EOL;
	
}

function shortcode_widget($atts) {
    
    global $wp_widget_factory;
    
    extract(shortcode_atts(array(
        'widget_name' => FALSE,
		'instance'    => ''
    ), $atts));
    
    $widget_name = wp_specialchars($widget_name);
    $instance = str_ireplace("&amp;", '&' ,$instance);
	
    if (!is_a($wp_widget_factory->widgets[$widget_name], 'WP_Widget')):
        $wp_class = 'WP_Widget_'.ucwords(strtolower($class));
        
        if (!is_a($wp_widget_factory->widgets[$wp_class], 'WP_Widget')):
            return '<p>'.sprintf(__("%s: Widget class not found. Make sure this widget exists and the class name is correct"),'<strong>'.$class.'</strong>').'</p>';
        else:
            $class = $wp_class;
        endif;
    endif;
    
    ob_start();
    the_widget($widget_name, $instance, array('widget_id'=>'arbitrary-instance-'.$id,
        'before_widget' => '',
        'after_widget' => '',
        'before_title' => '',
        'after_title' => ''
    ));
    $output = ob_get_contents();
    ob_end_clean();
    return $output;
    
}
add_shortcode('widget','shortcode_widget'); 

//mobile call now button 
add_action('wp_footer', function(){
	include HBPRO_THEME_PATH.'/template-parts/call-now-button.php';
});
//contact form 7
//cho phep contact form-7 them shortcode
/*
add_filter( 'wpcf7_form_elements', 'mycustom_wpcf7_form_elements' );

function mycustom_wpcf7_form_elements( $form ) {
	$form = do_shortcode( $form );
	return $form;
}
*/
//woocomerce
/*
add_filter( 'woocommerce_checkout_fields' , 'hb_woo_theme_custom_fields' );
function hb_woo_theme_custom_fields( $fields ) {
    unset($fields['billing']['billing_country']);
	unset($fields['billing']['billing_address_2']);
	$fields['billing']['billing_address_1']['type']='textarea';
	$fields['billing']['billing_address_1']['class']=['notes'];
	
	unset($fields['billing']['billing_state']);//['label']="Tỉnh/Thành phố";
	unset($fields['shipping']['shipping_company']);
	unset($fields['shipping']['shipping_country']);
	unset($fields['shipping']['shipping_address_2']);
	unset($fields['shipping']['shipping_city']);
	unset($fields['shipping']['shipping_state']);
	unset($fields['shipping']['shipping_postcode']);
	$fields['shipping']['shipping_address_1']['type']='textarea';
	$fields['shipping']['shipping_address_1']['required']=0;
	$fields['shipping']['shipping_first_name']['required']=0;
	$fields['shipping']['shipping_last_name']['required']=0;	
	$fields['shipping']['shipping_state']['label']="Tỉnh/Thành phố";
	$fields['billing']['billing_email']['required']=0;
	$fields['billing']['billing_phone2'] = [
		'label'=>'Số điện thoại dự phòng',
		'type'=>'tel',
		'priority'=>20];
	
	//sap xep
	$mybillingfields=array(
		"billing_first_name",
		"billing_last_name",
		"billing_company",
		"billing_phone",
		"billing_phone2",
		"billing_email",
		"billing_address_1",
	);
	$ordered_fields=[];
	foreach($mybillingfields as $field)
    {
        $ordered_fields[$field] = $fields["billing"][$field];
    }

    $fields["billing"] = $ordered_fields;
	//debug($fields);
	return $fields;
}
*/