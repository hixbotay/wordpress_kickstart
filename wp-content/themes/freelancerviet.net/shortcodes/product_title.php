<?php

function fvn_blog_featured($atts) {
	extract(shortcode_atts(array(
			'cat' => FALSE,
			'limit' => 5,
			'offset' => 0,
			'name' => '',
			'link' => ''
	), $atts));
	$link = get_category_link( $atts['cat'] );
	$atts['limit'] = $atts['limit'] ? $atts['limit'] : 5;
	$posts = get_posts ( array (
				'numberposts' => $atts['limit'] ,
				'category_name' => $atts['cat'],
				'offset'=>$atts['offset']
		) );
		
	foreach($posts as &$post){			
		$post_thumbnail_id = get_post_thumbnail_id( $post );
		$post->link = wp_get_canonical_url ( $post );
		$post->image = wp_get_attachment_image_url( $post_thumbnail_id, 'medium', false );		
	}
	
	ob_start();?>
	<div class="item-cat">
		<div class="cat-name"><span class="item-cat-title"><a class="text-white" href="<?php echo $atts['link']?>"><?php echo $atts['name']?></a></div>
		<div class="row">
			<div class="col medium-6 small-12 large-6 post-item">
				<a class="item-avatar" href="<?php echo $posts[0]->link?>" ><img class="avatar" src="<?php echo $posts[0]->image?>"/></a>
				<span class="item-content"><a class="text-green" href="<?php echo $posts[0]->link?>" ><b><?php echo $posts[0]->post_title?></b></a></span>
				<span class="excerpt"><?php echo $posts[0]->post_excerpt?></span>
			</div>
			<div class="col medium-6 small-12 large-6 post-item">
				<ul>
				<?php for($i=1; $i<count($posts); $i++){?>
					<li><a href="<?php echo $posts[$i]->link?>"><?php echo $posts[$i]->post_title?></a></li>
				<?php }?>
				</ul>
			</div>
		</div>
		<div class="clearfix"><a class="btn btn-white" href="<?php echo $atts['link']?>">Xem tiếp >></a></div>
		
	</div>
	<?php
	$output = ob_get_contents();
	ob_end_clean();
	return $output;

}
add_shortcode('blog_featured','fvn_blog_featured');
