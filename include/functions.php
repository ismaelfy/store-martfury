<?php
function display_link($title = 'chiry Store')
{
	$_GET['title'] = $title;
    include("links.php");
}
function display_sccripts()
{
    include 'scripts.php';
}
function display_carousel()
{
    include 'carousel.php';
}
function display_header()
{
    include 'header.php';
}
function display_navbar()
{
    include 'navbar.php';
}
function display_new_products()
{
    include 'new-products.php';
}
function diplay_shop_products()
{
	include 'shop-products.php';
}
function display_detail_products()
{
    include 'detail-products.php';
}
function display_brand_products()
{
	include 'brand-products.php';
}
function display_footer()
{
    include 'footer.php';
}