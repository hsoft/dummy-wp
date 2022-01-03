<?php get_header(); ?>
<h1><?php
    $title = get_the_title();
    if (strpos($title, "Collapse OS") === false) {
        echo "<a href=\"/\">Collapse OS</a> &mdash; ";
    }
    the_title();
?></h1>

<?php the_content(); ?>
<?php wp_link_pages(); ?>
<?php edit_post_link(); ?>

<?php get_footer(); ?>
