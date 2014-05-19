<?php echo $header;?>
<div id="content">
  <div class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
    <?php } ?>
  </div>
  <?php if ($error_warning) { ?>
  <div class="warning"><?php echo $error_warning; ?></div>
  <?php } ?>
  <div class="box">
    <div class="slidebar"><?php require( dirname(__FILE__).'/toolbar.tpl' ); ?></div>
    <div id="sticky_navigation" class="heading">
      <h1><img src="view/image/module.png" alt="" /> <?php echo $heading_title; ?></h1>
      <div class="buttons"><a onclick="$('#form').submit();" class="button"><?php echo $button_save; ?></a><a onclick="$('#action').val('save_stay');$('#form').submit();" class="button"><?php echo $button_save_stay; ?></a><a onclick="location = '<?php echo $cancel; ?>';" class="button"><?php echo $button_cancel; ?></a></div>
    </div>
    <div class="content">
      <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form">
        <input type="hidden" name="action" id="action" value=""/>
         
                  <div class="vtabs">
                    <?php $module_row = 1; ?>
                    <?php foreach ($modules as $module) { ?>
                    <a href="#tab-module-<?php echo $module_row; ?>" id="module-<?php echo $module_row; ?>"><?php echo $tab_block . ' ' . $module_row; ?>&nbsp;<img src="view/image/delete.png" alt="" onclick="$('.vtabs a:first').trigger('click'); $('#module-<?php echo $module_row; ?>').remove(); $('#tab-module-<?php echo $module_row; ?>').remove(); return false;" /></a>
                    <?php $module_row++; ?>
                    <?php } ?>
                    <span id="module-add"><?php echo $button_add_new_block; ?>&nbsp;<img src="view/image/add.png" alt="" onclick="addModule();" /></span> 
                  </div>
                  <?php $module_row = 1; ?>
                  <?php foreach ($modules as $module) { ?>
                  <div id="tab-module-<?php echo $module_row; ?>" class="vtabs-content">  
                    <table class="form">
                      <tr>
                        <td><?php echo $entry_layout; ?></td>
                        <td><select name="tm_revolutoin_slideshow_module[<?php echo $module_row; ?>][layout_id]">
                            <?php if ($module['layout_id'] == 0) { ?>
                            <option value="0" selected="selected"><?php echo $text_alllayout; ?></option>
                            <?php } else { ?>
                            <option value="0"><?php echo $text_alllayout; ?></option>
                            <?php } ?>
                            <?php foreach ($layouts as $layout) { ?>
                            <?php if ($layout['layout_id'] == $module['layout_id']) { ?>
                            <option value="<?php echo $layout['layout_id']; ?>" selected="selected"><?php echo $layout['name']; ?></option>
                            <?php } else { ?>
                            <option value="<?php echo $layout['layout_id']; ?>"><?php echo $layout['name']; ?></option>
                            <?php } ?>
                            <?php } ?>
                          </select></td>
                      </tr>
                <tr>
                  <td><?php echo $entry_store; ?></td>
                        <td><div class="scrollbox">
                            <?php $class = 'even'; ?>
                            <div class="<?php echo $class; ?>">
                              <?php if (isset($module['store_id']) && in_array(0, $module['store_id'])) { ?>
                              <input type="checkbox" name="tm_revolutoin_slideshow_module[<?php echo $module_row; ?>][store_id][]" value="0" checked="checked" />
                              <?php } else { ?>
                              <input type="checkbox" name="tm_revolutoin_slideshow_module[<?php echo $module_row; ?>][store_id][]" value="0" />
                              <?php } ?>
                    <?php echo $text_default; ?>
                            </div>
                            <?php foreach ($stores as $store) { ?>
                            <?php $class = ($class == 'even' ? 'odd' : 'even'); ?>
                            <div class="<?php echo $class; ?>">
                              <?php if (isset($module['store_id']) && in_array($store['store_id'], $module['store_id'])) { ?>
                              <input type="checkbox" name="tm_revolutoin_slideshow_module[<?php echo $module_row; ?>][store_id][]" value="<?php echo $store['store_id']; ?>" checked="checked" />
                              <?php echo $store['name']; ?>
                              <?php } else { ?>
                              <input type="checkbox" name="tm_revolutoin_slideshow_module[<?php echo $module_row; ?>][store_id][]" value="<?php echo $store['store_id']; ?>" />
                              <?php echo $store['name']; ?>
                              <?php } ?>
                            </div>
                            <?php } ?>
                          </div></td>
                      </tr>
                      <tr>
                        <td><?php echo $entry_position; ?></td>
                        <td>
                          <?php 
                          $custom_position = (isset($module['custom_position']) && !empty($module['custom_position']))?$module['custom_position']:'';
                          $tmp_positions = $positions;
                          if(!empty($custom_position)){
                            $tmp_positions[] = $custom_position;
                          }
                          
                          ?>
                          <select name="tm_revolutoin_slideshow_module[<?php echo $module_row; ?>][position]">
                                     <?php foreach( $tmp_positions as $pos ) { ?>
                                              <?php if ($module['position'] == $pos) { ?>
                                              <option value="<?php echo $pos;?>" selected="selected"><?php echo $this->language->get('text_'.$pos); ?></option>
                                              <?php } else { ?>
                                              <option value="<?php echo $pos;?>"><?php echo $this->language->get('text_'.$pos); ?></option>
                                              <?php } ?>
                                              <?php } ?> 
                                            </select></td>
                      </tr>
                      <tr>
                        <td><?php echo $entry_custom_position; ?></td>
                        <td><input type="text" name="tm_revolutoin_slideshow_module[<?php echo $module_row; ?>][custom_position]" value="<?php echo $custom_position; ?>" size="30" /></td>
                      </tr>
                      <tr>
                        <td><?php echo $entry_status; ?></td>
                        <td><select name="tm_revolutoin_slideshow_module[<?php echo $module_row; ?>][status]">
                            <?php if ($module['status']) { ?>
                            <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                            <option value="0"><?php echo $text_disabled; ?></option>
                            <?php } else { ?>
                            <option value="1"><?php echo $text_enabled; ?></option>
                            <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                            <?php } ?>
                          </select></td>
                      </tr>
                      <tr>
                        <td><?php echo $entry_sort_order; ?></td>
                        <td><input type="text" name="tm_revolutoin_slideshow_module[<?php echo $module_row; ?>][sort_order]" value="<?php echo $module['sort_order']; ?>" size="3" /></td>
                      </tr>
                      
                       
                      <tr>
                        <td><?php echo $this->language->get("entry_banner"); ?></td>
                        <td><select size="10" name="tm_revolutoin_slideshow_module[<?php echo $module_row; ?>][banner_id]">
                          <option value="0"><?php echo $this->language->get("text_select_banner");?></option>
                            <?php 
                             if($banners){
                              foreach($banners as $banner){
                                if($banner['ecbanner_id'] == $module['banner_id']){
                                ?>
                                  <option value="<?php echo $banner['ecbanner_id'] ?>" selected="selected"><?php echo $banner['name']; ?></option>
                                <?php
                                }else{
                                  ?>
                                   <option value="<?php echo $banner['ecbanner_id'] ?>"><?php echo $banner['name']; ?></option>
                                  <?php
                                }
                              }
                             }
                            ?>
                          </select></td>
                      </tr>

                      <tr>
                        <td><?php echo $this->language->get("entry_limit"); ?></td>
                        <td><input type="text" name="tm_revolutoin_slideshow_module[<?php echo $module_row; ?>][limit]" value="<?php echo $module['limit']; ?>" size="10" /></td>
                      </tr>
                      

                       <tr>
                        <td><?php echo $this->language->get("entry_module_width"); ?></td>
                        <td><input type="text" name="tm_revolutoin_slideshow_module[<?php echo $module_row; ?>][module_width]" value="<?php echo $module['module_width']; ?>" size="10" /></td>
                      </tr>
                       <tr>
                        <td><?php echo $this->language->get("entry_module_height"); ?></td>
                        <td><input type="text" name="tm_revolutoin_slideshow_module[<?php echo $module_row; ?>][module_height]" value="<?php echo $module['module_height']; ?>" size="10" /></td>
                      </tr>
                      <tr>
                        <td><?php echo $this->language->get("entry_main_width"); ?></td>
                        <td><input type="text" name="tm_revolutoin_slideshow_module[<?php echo $module_row; ?>][main_width]" value="<?php echo $module['main_width']; ?>" size="10" /></td>
                      </tr>
                      <tr>
                        <td><?php echo $this->language->get("entry_main_height"); ?></td>
                        <td><input type="text" name="tm_revolutoin_slideshow_module[<?php echo $module_row; ?>][main_height]" value="<?php echo $module['main_height']; ?>" size="10" /></td>
                      </tr>
                     
                      <tr>
                        <td colspan="2"><b><?php echo $this->language->get("entry_slider_caption"); ?></b></td>
                      </tr>
                    
                      <tr>
                        <td><?php echo $this->language->get("entry_strip_html_code"); ?></td>
                        <td><select name="tm_revolutoin_slideshow_module[<?php echo $module_row; ?>][is_striped]">
                            <?php 
                             if($yesno){
                              foreach($yesno as $key=>$val){
                                if($key == $module['is_striped']){
                                ?>
                                  <option value="<?php echo $key; ?>" selected="selected"><?php echo $val; ?></option>
                                <?php
                                }else{
                                  ?>
                                  <option value="<?php echo $key; ?>"><?php echo $val; ?></option>
                                  <?php
                                }
                              }
                             }
                            ?>
                          </select></td>
                      </tr>
                     
                    
                    
                      <tr>
                        <td><?php echo $this->language->get("entry_title_max_chars"); ?></td>
                        <td><input type="text" name="tm_revolutoin_slideshow_module[<?php echo $module_row; ?>][title_max_chars]" value="<?php echo $module['title_max_chars']; ?>" size="10" /></td>
                      </tr>
                      <tr>
                        <td><?php echo $this->language->get("entry_description_max_chars"); ?></td>
                        <td><input type="text" name="tm_revolutoin_slideshow_module[<?php echo $module_row; ?>][description_max_chars]" value="<?php echo $module['description_max_chars']; ?>" size="10" /></td>
                      </tr>
                      
  
                      
                      
                    </table>
                  </div>
                  <?php $module_row++; ?>
                  <?php } ?>
      </form>
    </div>
  </div>
</div>
<script type="text/javascript"><!--
$(function() {

    // grab the initial top offset of the navigation 
    var sticky_navigation_offset_top = $('#sticky_navigation').offset().top;
    
    // our function that decides weather the navigation bar should have "fixed" css position or not.
    var sticky_navigation = function(){
        var scroll_top = $(window).scrollTop(); // our current vertical position from the top
        
        // if we've scrolled more than the navigation, change its position to fixed to stick to top,
        // otherwise change it back to relative
        if (scroll_top > sticky_navigation_offset_top) {
            $('#sticky_navigation').css({ 'position': 'fixed', 'top':0, 'left':0, 'width': '100%' });
        } else {
            $('#sticky_navigation').css({ 'position': 'relative', 'width': '98.8%' }); 
        }   
    };
    
    // run our function on load
    sticky_navigation();
    
    // and run it again every time you scroll
    $(window).scroll(function() {
         sticky_navigation();
    });

});
//--></script>
<script type="text/javascript"><!--
var module_row = <?php echo $module_row; ?>;
function addModule() {
  html ='<div id="tab-module-'+module_row+'" class="vtabs-content"> ';
  html +='         <table class="form">';
  html +='          <tr>';
  html +='            <td><?php echo $entry_layout; ?></td>';
  html +='            <td><select name="tm_revolutoin_slideshow_module['+module_row+'][layout_id]">';
  html +='                <option value="0"><?php echo $text_alllayout; ?></option>';
                  <?php foreach ($layouts as $layout) { ?>
  html +='                <option value="<?php echo $layout['layout_id']; ?>"><?php echo $layout['name']; ?></option>';
                  <?php } ?>
  html +='              </select></td>';
  html +='          </tr>';
  html +='    <tr>';
  html +='      <td><?php echo $entry_store; ?></td>';
  html +='            <td><div class="scrollbox">';
                  <?php $class = 'even'; ?>
  html +='                <div class="<?php echo $class; ?>">';
  html +='                  <input type="checkbox" name="tm_revolutoin_slideshow_module['+module_row+'][store_id][]" value="0" checked="checked"/>';
  html +='        <?php echo $text_default; ?>';
  html +='                </div>';
                  <?php foreach ($stores as $store) { ?>
                  <?php $class = ($class == 'even' ? 'odd' : 'even'); ?>
  html +='                <div class="<?php echo $class; ?>">';
  html +='                  <input type="checkbox" name="tm_revolutoin_slideshow_module['+module_row+'][store_id][]" value="<?php echo $store['store_id']; ?>" />';
  html +='                  <?php echo $store['name']; ?>';
  html +='                </div>';
                  <?php } ?>
  html +='              </div></td>';
  html +='    </tr>';

                     
  html +='          <tr>';
  html +='            <td><?php echo $entry_position; ?></td>';
  html +='            <td><select name="tm_revolutoin_slideshow_module['+module_row+'][position]">';
                           <?php foreach( $positions as $pos ) { ?>
  html +='                                  <option value="<?php echo $pos;?>"><?php echo $this->language->get('text_'.$pos); ?></option>';
                                    <?php } ?> 
  html +='                                </select></td>';
  html +='          </tr>';
  html +=' <tr>';
  html +='                      <td><?php echo $entry_custom_position; ?></td>';
  html +='                      <td><input type="text" name="tm_revolutoin_slideshow_module['+module_row+'][custom_position]" value="" size="30" /></td>';
  html +='                    </tr>';
  html +='          <tr>';
  html +='            <td><?php echo $entry_status; ?></td>';
  html +='            <td><select name="tm_revolutoin_slideshow_module['+module_row+'][status]">';
  html +='                <option value="1"><?php echo $text_enabled; ?></option>';
  html +='                <option value="0"><?php echo $text_disabled; ?></option>';

  html +='              </select></td>';
  html +='          </tr>';
  html +='          <tr>';
  html +='            <td><?php echo $entry_sort_order; ?></td>';
  html +='            <td><input type="text" name="tm_revolutoin_slideshow_module['+module_row+'][sort_order]" value="" size="3" /></td>';
  html +='          </tr>';
  
  html +='<tr>';
  html +='                      <td><?php echo $this->language->get("entry_banner"); ?></td>';
  html +='                      <td><select size="10" name="tm_revolutoin_slideshow_module['+module_row+'][banner_id]">';
  html +='                        <option value="0"><?php echo $this->language->get("text_select_banner");?></option>';
                            <?php 
                             if($banners){
                              foreach($banners as $banner){
                                if($banner['ecbanner_id'] == $default['banner_id']){
                                  ?>
 html +='                       <option value="<?php echo $banner['ecbanner_id'] ?>" selected="selected"><?php echo $banner['name']; ?></option>';
                                  <?php
                                }else{
                                ?>
  html +='                                 <option value="<?php echo $banner['ecbanner_id'] ?>"><?php echo $banner['name']; ?></option>';
                                  <?php
                                }
                              }
                             }
                            ?>
  html +='                        </select></td>';
  html +='                    </tr>';
  html +='<tr>';
  html +='                      <td><?php echo $this->language->get("entry_limit"); ?></td>';
  html +='                      <td><input type="text" name="tm_revolutoin_slideshow_module['+module_row+'][limit]" value="<?php echo $default['limit']; ?>" size="10" /></td>';
  html +='                    </tr>';
 
  html +='                     <tr>';
  html +='                      <td><?php echo $this->language->get("entry_module_width"); ?></td>';
  html +='                      <td><input type="text" name="tm_revolutoin_slideshow_module['+module_row+'][module_width]" value="<?php echo $default['module_width']; ?>" size="10" /></td>';
  html +='                    </tr>';
  html +='                     <tr>';
  html +='                      <td><?php echo $this->language->get("entry_module_height"); ?></td>'
  html +='                      <td><input type="text" name="tm_revolutoin_slideshow_module['+module_row+'][module_height]" value="<?php echo $default['module_height']; ?>" size="10" /></td>';
  html +='                    </tr>';
  html +='                    <tr>';
  html +='                      <td><?php echo $this->language->get("entry_main_width"); ?></td>';
  html +='                      <td><input type="text" name="tm_revolutoin_slideshow_module['+module_row+'][main_width]" value="<?php echo $default['main_width']; ?>" size="10" /></td>';
  html +='                    </tr>';

  html +='                    <tr>';
  html +='                      <td><?php echo $this->language->get("entry_main_height"); ?></td>';
  html +='                      <td><input type="text" name="tm_revolutoin_slideshow_module['+module_row+'][main_height]" value="<?php echo $default['main_height']; ?>" size="10" /></td>';
  html +='                    </tr>';
 

  html +='<tr>';
  html +='                      <td colspan="2"><b><?php echo $this->language->get("entry_slider_caption"); ?></b></td>';
  html +='                    </tr>';
 
   html +='                    <tr>';
  html +='                      <td><?php echo $this->language->get("entry_strip_html_code"); ?></td>';
  html +='                      <td><select name="tm_revolutoin_slideshow_module['+module_row+'][is_striped]">';
                            <?php 
                             if($yesno){
                              foreach($yesno as $key=>$val){
                                if($key == $default['is_striped']):
                                ?>
  html +='                                <option value="<?php echo $key; ?>" selected="selected"><?php echo $val; ?></option>';
                                  <?php
                                else:
                                  ?>
  html +='                                <option value="<?php echo $key; ?>"><?php echo $val; ?></option>';
                                <?php
                                endif;
                                
                              }
                             }
                            ?>
  html +='                        </select></td>';
  html +='                    </tr>';

  html +='                    <tr>';
  html +='                      <td><?php echo $this->language->get("entry_title_max_chars"); ?></td>';
  html +='                      <td><input type="text" name="tm_revolutoin_slideshow_module['+module_row+'][title_max_chars]" value="<?php echo $default['title_max_chars']; ?>" size="10" /></td>';
  html +='                    </tr>';
  html +='                    <tr>';
  html +='                      <td><?php echo $this->language->get("entry_description_max_chars"); ?></td>';
  html +='                      <td><input type="text" name="tm_revolutoin_slideshow_module['+module_row+'][description_max_chars]" value="<?php echo $default['description_max_chars']; ?>" size="10" /></td>';
  html +='                    </tr>';
  
 
  
 
                 



    html +='        </table>';
    html +='      </div>';
  
  $('#form').append(html);
  
  $('#module-add').before('<a href="#tab-module-' + module_row + '" id="module-' + module_row + '"><?php echo $tab_block; ?> ' + module_row + '&nbsp;<img src="view/image/delete.png" alt="" onclick="$(\'.vtabs a:first\').trigger(\'click\'); $(\'#module-' + module_row + '\').remove(); $(\'#tab-module-' + module_row + '\').remove(); return false;" /></a>');
  
  $('.vtabs a').tabs();
  $('#language-general a').tabs();
  $('#module-' + module_row).trigger('click');

 

  

  
  module_row++;
}
//--></script> 
<script type="text/javascript"><!--
$('.vtabs a').tabs();

//--></script>
<script type="text/javascript"><!--
$('#language-general a').tabs();
//--></script>

<?php echo $footer; ?>