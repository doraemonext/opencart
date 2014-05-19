</div><!-- content inner div end -->
</section>
<!-- section code end -->


<footer id="footer-container">
<div class="custom_footer_main_block column">
			<div class="custom_footer_inner_block">
				<?php echo $content_footer_block; ?>
			</div>
</div>

<footer id="footer-container">
<div class="footer-inner">
	<div id="footer">
	  <?php if ($informations) { ?>
	  <div class="column">
		<h3><?php echo $text_information; ?></h3>
		<ul>
		  <?php foreach ($informations as $information) { ?>
		  <li><a href="<?php echo $information['href']; ?>"><?php echo $information['title']; ?></a></li>
		  <?php } ?>
		</ul>
	  </div>
	  <?php } ?>
	
	   
		<!--	
		  <div class="column">
		<h3><?php /*echo $text_service;*/ ?></h3>
		<ul>
		  <li><a href="<?php /*echo $contact;*/ ?>"><?php/* echo $text_contact;*/ ?></a></li>
		  <li><a href="<?php /*echo $return;*/ ?>"><?php /*echo $text_return;*/ ?></a></li>
		  <li><a href="<?php /*echo $sitemap;*/ ?>"><?php /*echo $text_sitemap;*/ ?></a></li>
		</ul>
	  </div>-->
			
	  <div class="column">
		<h3><?php echo $text_extra; ?></h3>
		<ul>
		  <li><a href="<?php echo $manufacturer; ?>"><?php echo $text_manufacturer; ?></a></li>
		  <li><a href="<?php echo $voucher; ?>"><?php  echo $text_voucher; ?></a></li>
		  <li><a href="<?php echo $affiliate; ?>"><?php  echo $text_affiliate; ?></a></li>
		  <li><a href="<?php echo $special; ?>"><?php  echo $text_special; ?></a></li>
		</ul>
	  </div>
	 <div class="column">
		<h3><?php echo $text_account; ?></h3>
		<ul>
		  <li><a href="<?php echo $account; ?>"><?php echo $text_account; ?></a></li>
		  <li><a href="<?php echo $order; ?>"><?php echo $text_order; ?></a></li>
		  <li><a href="<?php echo $wishlist; ?>"><?php echo $text_wishlist; ?></a></li>
		  <li><a href="<?php echo $newsletter; ?>"><?php echo $text_newsletter; ?></a></li>
		</ul>
	  </div>
	  
	  <div class="custom_block_footer">
			<div class="custom_block_inner_footer">
				<?php echo $content_block_footer; ?>
		</div>
	 </div>
	 
	
</div>
	 <div id="bottomfooter">
	
 	<ul>
	   
	   <li><a href="<?php echo $special; ?>"><?php echo $text_special; ?></a></li>
		
           <li><a href="<?php echo $affiliate; ?>"><?php echo $text_affiliate; ?></a></li>
    
	   <li><a href="<?php echo $voucher; ?>"><?php echo $text_voucher; ?></a></li>
	 
	   <li><a href="<?php echo $manufacturer; ?>"><?php echo $text_manufacturer; ?></a></li>	   
		
           <li><a href="<?php echo $return; ?>"><?php echo $text_return; ?></a></li> 
		
           <li><a href="<?php echo $sitemap; ?>"><?php echo $text_sitemap; ?></a></li>
		
           <li class="login-logout"><a href="<?php echo $contact; ?>"><?php echo $text_contact; ?></a></li>
	
	</ul>

</div>

<div class="copyright-container">
<!--
OpenCart is open source software and you are free to remove the powered by OpenCart if you want, but its generally accepted practise to make a small donation.
Please donate via PayPal to donate@opencart.com
//-->
<div id="powered"><?php echo $powered; ?></div>

<div class="paiement_logo_block" id="paiement_logo_block_left">
<ul>
	<li class="visa"><a href="#">&nbsp;</a></li>
	<li class="master"><a href="#">&nbsp;</a></li>
	<li class="paypal"><a href="#">&nbsp;</a></li>
	<li class="american_express"><a href="#">&nbsp;</a></li>
</ul>
</div>


 

<!--
OpenCart is open source software and you are free to remove the powered by OpenCart if you want, but its generally accepted practise to make a small donation.
Please donate via PayPal to donate@opencart.com
//-->	 
</div>

</div>
</footer>


</div>
<span class="grid_default_width" style="display: none; visibility: hidden;" ></span>
<span class="home_products_default_width" style="display:none; visibility:hidden"></span>
<span class="module_default_width" style="display:none; visibility:hidden"></span>
</body></html>