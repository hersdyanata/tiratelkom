<tr>
    <td hidden>
        <input type="hidden" class="form-control" name="mom_id[]" value="{{ $discuss->mom_id }}">
    </td>
    <td hidden>
        <input type="hidden" class="form-control" name="agenda_id[]" value="{{ $discuss->agenda_id }}">
    </td>
    <td hidden>
        <input type="hidden" class="form-control" name="discuss[]"  value="{{ $discuss->discuss_id }}">
    </td>
    <td width="10%" class="text-center">
        <input type="text" class="form-control daterange-single" name="prog_date[]" id="prog_date">
    </td>
    <td width="90%">
        <input type="text" class="form-control" name="prog_desc[]" id="prog_desc">
    </td>
</tr> 

<script>
    $('.daterange-single').daterangepicker({
        parentEl: '.content-inner',
        singleDatePicker: true
    }); 
</script>      