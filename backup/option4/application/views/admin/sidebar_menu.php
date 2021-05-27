<!--sidebar start-->
<aside>
    <div id="sidebar"  class="nav-collapse ">
        <!-- sidebar menu start-->
        <ul class="sidebar-menu" id="nav-accordion">
            <li>
                <a <?php echo!empty($tabActive) && $tabActive == 'dashboard' ? 'class="active"' : ''; ?> href="<?php echo admin_url(); ?>">
                    <i class="icon-dashboard"></i>
                    <span>Dashboard</span>
                </a>
            </li>
            
            <li class="sub-menu">
                <a href="javascript:void(0)" <?php echo!empty($tabActive) && $tabActive == 'jilancollection' ? 'class="active"' : ''; ?> >
                    <i class="icon-shopping-cart"></i>
                    <span>Diones Collection</span>
                </a>
                <ul class="sub">
                    <li <?php echo!empty($subTabActive) && $subTabActive == 'jilancollection_category' ? 'class="active"' : ''; ?>><a href="<?php echo admin_url('jilancollectionCat') ?>">Category</a></li>
                    <li <?php echo!empty($subTabActive) && $subTabActive == 'jilancollection_manage' ? 'class="active"' : ''; ?>><a href="<?php echo admin_url('jilancollection'); ?>">Manage Collection</a></li>
                    <li <?php echo!empty($subTabActive) && $subTabActive == 'jilancollection_add' ? 'class="active"' : ''; ?>><a href="<?php echo admin_url('jilancollection/add'); ?>">Add Product</a></li>
                </ul>
            </li>
        </ul>
        <!-- sidebar menu end-->
    </div>
</aside>
<!--sidebar end-->