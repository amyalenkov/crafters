<script type="text/javascript">
$('document').ready(function() {
    $('.theme a').each(function() {
        if ('http://http://10.1.2.32:3000/'+$(this).attr('href') == window.location.href)
        {
            $(this).addClass('active');
        }
    });
    });
</script>