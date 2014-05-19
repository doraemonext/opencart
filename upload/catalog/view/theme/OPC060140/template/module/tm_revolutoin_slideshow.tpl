<div class="fullwidthbanner-container" style="width:<?php echo $module_width;?>;height:<?php echo $module_height;?>"  id="fullwidthbanner-container<?php echo $module;?>">
<div class="fullwidthbanner">
<ul> 
    <?php if(isset($slides) && !empty($slides)){ ?>
	<?php foreach ($slides as $slide) { ?>
			<?php
				$params = isset($slide['params'])?$slide['params']:array();
				$show_link = (isset($params['show_link']) && $params['show_link'])?' data-link="'.$slide["link"].'"':"";
			?>	
			
	<li data-transition="random" data-slotamount="7" <?php echo $show_link; ?> >
		<img src="<?php echo $slide['image']; ?>" alt="<?php echo $slide['title']; ?>" />
		<?php echo $slide["description"]; ?>
	</li>
    <?php } ?>
	<?php } ?>
</ul>
</div>
</div>
 <script type="text/javascript">

      function  loadSlideshow<?php echo $module;?>(){

jQuery('.fullwidthbanner').show().revolution({
		delay: 9000,
		startwidth: 1000,
		startheight: 404,
		hideThumbs: 200,
		thumbWidth: 100,
		thumbHeight: 50,
		thumbAmount: 1,
		navigationType: 'bullet',
		navigationArrows: 'solo',
		navigationStyle: 'round-old',
		touchenabled: 'on',
		onHoverStop: 'on',
		navigationHAlign: 'center',
		navigationVAlign: 'bottom',
		navigationHOffset: '0',
		navigationVOffset: '20',
		soloArrowLeftHalign: 'left',
		soloArrowLeftValign: 'center',
		soloArrowLeftHOffset: '20',
		soloArrowLeftVOffset: '0',
		soloArrowRightHalign: 'right',
		soloArrowRightValign: 'center',
		soloArrowRightHOffset: '20',
		soloArrowRightVOffset: '0',
		shadow: 0,
		fullWidth: 'on',
		fullScreen: 'off',
		stopLoop: 'off',
		stopAfterLoops: -1,
		stopAtSlide: -1,
		shuffle: 'off',
		hideSliderAtLimit: 0,
		hideCaptionAtLimit: 0,
		hideAllCaptionAtLilmit: 0,
		startWithSlide: 0,
		fullScreenOffsetContainer: ''
		});
  

};
	
</script>
<script type="text/javascript">


	jQuery(function(){
		loadSlideshow<?php echo $module;?>();
	});

</script>