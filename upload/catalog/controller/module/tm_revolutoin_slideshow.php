<?php
/******************************************************
 * @package Camera Slideshow for Opencart 1.5.x
 * @version 1.0
 * @author ecomteck (http://ecomteck.com)
 * @copyright	Copyright (C) May 2013 ecomteck.com <@emai:ecomteck@gmail.com>.All rights reserved.
 * @license		GNU General Public License version 2
*******************************************************/

class ControllerModuletmrevolutoinslideshow extends Controller {
	protected function index($setting = array()) {
		static $module = 0;
		if(empty($setting)){
			$modules = $this->config->get('tm_revolutoin_slideshow_module');
			if ($modules) {
				foreach ($modules as $module) {  
					if ( ($module['layout_id'] == '0' ) && $module['status']) {
						$setting = $module;
						break;			
					}
				}
			}
		}
		$current_store_id = $this->config->get('config_store_id');
		$stores = isset($setting['store_id'])?$setting['store_id']:array();
		if(!empty($stores) && !in_array($current_store_id, $stores)){
			return;
		}
		$this->language->load('module/tm_revolutoin_slideshow');
		$this->load->model('tm_revolutoin_slideshow/banner');
		$this->load->model('catalog/product');
		$this->load->model('tool/image');
		//$setting = $this->defaultConfig($setting);
		
		$this->document->addScript('catalog/view/javascript/tm_revolutoin_slideshow/jquery.themepunch.plugins.min.js');
		$this->document->addScript('catalog/view/javascript/tm_revolutoin_slideshow/jquery.themepunch.revolution.min.js');	
		
		
		$this->document->addStyle('catalog/view/theme/'.$this->config->get('config_template').'/stylesheet/settings.css');
		$this->document->addStyle('catalog/view/theme/'.$this->config->get('config_template').'/stylesheet/captions-original.css');
		
	
	    
		if (isset($this->request->server['HTTPS']) && (($this->request->server['HTTPS'] == 'on') || ($this->request->server['HTTPS'] == '1'))) {
         	$base = $this->config->get('config_ssl');
         	$base = empty($base)?HTTPS_CATALOG:$base;
	    } else {
	        $base = $this->config->get('config_url');
	        $base = empty($base)?HTTP_CATALOG:$base;
	    }
	    $this->data['base'] = $base;
	    

	   

	    $lang_id = $this->config->get('config_language_id');
	    $this->data['button_cart'] = $this->language->get("button_cart");
	
	 
	    $this->data["overlayer"] = isset($setting["overlayer"])?$setting["overlayer"]:1;
	    $this->data["pie_diameter"] = isset($setting["pie_diameter"])?$setting["pie_diameter"]:38;
	    $this->data["pie_position"] = isset($setting["pie_position"])?$setting["pie_position"]:"rightTop";
	    $this->data["sliced_cols"] = isset($setting["sliced_cols"])?$setting["sliced_cols"]:12;
	    $this->data["sliced_rows"] = isset($setting["sliced_rows"])?$setting["sliced_rows"]:8;
	    $this->data["slide_on"] = isset($setting["slide_on"])?$setting["slide_on"]:'random';
	    $this->data["thumbnails"] = isset($setting["thumbnails"])?$setting["thumbnails"]:0;

	    $data_source = isset($setting["data_source"])?$setting["data_source"]:"banner";
	    $limit = isset($setting["limit"])?$setting["limit"]:5;
	   
	    $this->data["module_width"] = isset($setting["module_width"])?$setting["module_width"]:"800px";
	    $this->data["module_height"] = isset($setting["module_height"])?$setting["module_height"]:"600px";
	 
		

	    $this->data["slides"] = array();
	    $banners = array();

	    $setting['banner_id'] = isset($setting['banner_id'])?(int)$setting['banner_id']:0;
	   

	    if(!empty($setting['banner_id'])){
	    	$banners = $this->model_tm_revolutoin_slideshow_banner->getBanner($setting['banner_id'], $limit, $setting['banner_id']);
		    $this->data["slides"] = $this->getBannerInfo($banners, $setting);

			$this->data['module'] = $module++;

			if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/tm_revolutoin_slideshow.tpl')) {
				$this->template = $this->config->get('config_template') . '/template/module/tm_revolutoin_slideshow.tpl';
			} else {
				$this->template = 'default/template/module/tm_revolutoin_slideshow.tpl';
			}

			$this->render();
	    }
	    return false;
	}
	function getBannerInfo($banners = array(), $setting= array()){
		$data = array();
		$banner_info = $banners['banner_info'];
		$banners = $banners['banners'];
		$main_width = $main_height = 0;
		if($banner_info){
			$main_width = isset($banner_info["main_width"])?$banner_info["main_width"]:"0";
	   		$main_height = isset($banner_info["main_height"])?$banner_info["main_height"]:"0";
		}
		if(empty($main_width) && empty($main_height)){
			$main_width = isset($setting["main_width"])?$setting["main_width"]:"800";
	    	$main_height = isset($setting["main_height"])?$setting["main_height"]:"600";
		}
		
	
		$title_max_chars =  isset($setting["title_max_chars"])?$setting["title_max_chars"]:"100";
		$description_max_chars =  isset($setting["description_max_chars"])?$setting["description_max_chars"]:"150";
		$resize_image = isset($setting["resize_image"])?$setting["resize_image"]:"1";
		$resize_type = isset($setting["resize_type"])?$setting["resize_type"]:"w";
		$is_striped = isset($setting["is_striped"])?$setting["is_striped"]: 1;

		foreach ($banners as $banner) {
			$image = false;
			$thumb = false;
			$rating = false;
			$price = false;
			$special = false;
			$reviews = false;
			if(!empty($banner['image'])){
				if($resize_image){
					$image = $this->model_tool_image->resize($banner['image'], $main_width, $main_height, $resize_type);
				}else{
					if (isset($this->request->server['HTTPS']) && (($this->request->server['HTTPS'] == 'on') || ($this->request->server['HTTPS'] == '1'))) {
						$image = $this->config->get('config_ssl') . 'image/' . $banner['image'];
					} else {
						$image = $this->config->get('config_url') . 'image/' . $banner['image'];
					}
				}
				
				
			}
			$description = html_entity_decode($banner['description'], ENT_QUOTES, 'UTF-8');
			$description = $this->substring($description, $description_max_chars, '...', $is_striped);
			

			$banner['title'] = $this->substring($banner['title'], $title_max_chars);
			$banner['params'] = isset($banner['params'])?unserialize($banner['params']):array();
			$data[] = array(
				'thumb'   	 => $thumb,
				'image'		 => $image,
				'caption'    => $banner['title'],
				'link'    	 => $banner['link'],
				'description'=> $description,
				'params'	 => $banner['params']
			);
		}
		return $data;
	}
	
	protected function substring( $text, $length = 100, $replacer ='...', $is_striped=true ){
    		$text = ($is_striped==true)?strip_tags($text):$text;
    		if(strlen($text) <= $length){
    			return $text;
    		}
    		$text = substr($text,0,$length);
    		$pos_space = strrpos($text,' ');
    		return substr($text,0,$pos_space).$replacer;
	}
	
}
?>
