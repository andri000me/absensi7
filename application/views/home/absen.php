</script>
<div class="container" >
	<div class="row">
		<div class="col-sm-6 col-sm-offset-3 text-center">
			<h4 id="demo3"></h4>
			<h4> <?php $this->load->helper('bulan');
            echo bulan(date('Y-m-d'));?></h4>
		</div>
	</div>
</div>
<br>
<div class="container">
    <div class="row">
        <div class="col-sm-6 col-sm-offset-3">
            <form class="bootstrap-form-with-validation" method="POST" action="">
                <div class="form-group">
                    <label class="control-label">Nama </label>
                    <select class="form-control">
                        <option value="12" selected="">This is item 1</option>
                        <option value="13">This is item 2</option>
                        <option value="14">This is item 3</option>
                    </select>
                </div>
                <div class="form-group">
                    <label class="control-label">Status </label>
                    <select class="form-control">
                        <option value="12" selected="">This is item 1</option>
                        <option value="13">This is item 2</option>
                        <option value="14">This is item 3</option>
                    </select>
                </div>
                <div class="form-group">
                    <label class="control-label" for="textarea-input">Keterangan </label>
                    <textarea class="form-control" name="textarea-input" id="textarea-input"></textarea>
                </div>
                <div class="form-group">
                    <label class="control-label" for="password-input">Password</label>
                    <input class="form-control" type="password" name="password-input" id="password-input">
                </div>
                <button class="btn btn-success btn-block" type="submit"><i class="glyphicon glyphicon-send" aria-hidden="true"></i> SUBMIT </button>
            </form>
        </div>
    </div>
</div>
<br>
<br>


<?php
    $date = new DateTime();
    $current_timestamp = $date->getTimestamp();
?>
<script type="text/javascript">
	
    flag = true;
    timer = '';
    setInterval(function(){phpJavascriptClock();},1000);
    function phpJavascriptClock()
    {
        if ( flag ) {
            timer = <?php echo $current_timestamp;?>*1000;
        }
        var d = new Date(timer);
        // months = new Array('Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sept', 'Oct', 'Nov', 'Dec');
        // month_array = new Array('Januari', 'Februari', 'Maret', 'April', 'May', 'June', 'July', 'Agustus', 'September', 'Oktober', 'November', 'December');
        currentYear = d.getFullYear();
        month = d.getMonth();
        // var currentMonth = months[month];
        // var currentMonth1 = month_array[month];
        var currentDate = d.getDate();
        var hours = d.getHours();
        var minutes = d.getMinutes();
        var seconds = d.getSeconds();
        minutes = minutes < 10 ? '0'+minutes : minutes;
        seconds = seconds < 10 ? '0'+seconds : seconds;
        var strTime = hours + ':' + minutes+ ':' + seconds;

        document.getElementById("demo3").innerHTML= strTime ;

        flag = false;
        timer = timer + 1000;
    }
	
</script>