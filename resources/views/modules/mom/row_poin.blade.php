<hr>
<div class="row">
    <div class="col-lg-12">
        <fieldset>  
            <input type="hidden" class="form-control" name="mom_id[]" id="mom_id" value="{{ $agenda->mom_id }}">
            <input type="hidden" class="form-control" name="agenda_id[]" id="agenda_id" value="{{ $agenda->agenda_id }}">

            <div class="row">
                <div class="col-lg-12">
                    <div class="form-group"> 
                        <label class="font-weight-semibold">Pointer</label>
                        <textarea placeholder="Pointer" class="form-control input_diskusi" name="pointer[]" id="pointer"></textarea>
                    </div>
                </div> 
            </div> 

            <div class="row">
                <div class="col-lg-12">
                    <div class="form-group"> 
                        <label class="font-weight-semibold">Assignment</label>
                        <textarea type="text" placeholder="Assignment" class="form-control input_diskusi" name="assignment[]" id="assignment"></textarea>
                    </div>
                </div> 
            </div>

            <div class="row">
                <div class="col-lg-3">
                    <div class="form-group">
                        <label class="font-weight-semibold">UIC</label>
                        <div class="form-group">
                            <select class="form-control select input_diskusi" name="uic[]" id="uic">
                                <option value="">-- Choose --</option>
                                @foreach ($uics as $r)
                                    <option value="{{ $r->uic_id }}">{{ $r->uic_code }}</option>
                                @endforeach
                            </select>
                        </div>
                    </div>
                </div>

                <div class="col-lg-3">
                    <div class="form-group">
                        <label class="font-weight-semibold">Due Date</label>
                        <div class="form-group form-group-feedback form-group-feedback-right">
                            <input type="text" placeholder="Set Due Date" class="form-control due_date input_diskusi" name="due_date[]" id="due_date">
                            <div class="form-control-feedback">
                                <i class="icon-calendar22 text-muted"></i>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-lg-3">
                    <div class="form-group">
                        <label class="font-weight-semibold">Priority</label>
                        <div class="form-group">
                            <select class="form-control select input_diskusi" name="priority[]" id="priority">
                                <option value="3">High</option>
                                <option value="2">Normal</option>
                                <option value="1">Low</option>
                            </select>
                        </div>
                    </div>
                </div> 

                <div class="col-lg-3">
                    <div class="form-group">
                        <label class="font-weight-semibold">Status</label>
                        <div class="form-group">
                            <select class="form-control select input_diskusi" name="status[]" id="status">
                                <option value="O">Open</option>
                                <option value="C">Closed</option>
                            </select>
                        </div>
                    </div>
                </div> 
            </div>
        </fieldset>
    </div>
</div> 
<script>
    $('.due_date').daterangepicker({
        parentEl: '.content-inner',
        singleDatePicker: true,
        locale: {
            format: 'DD/MM/YYYY'
        }
    });

    $('.select-fixed-single').select2({
        minimumResultsForSearch: Infinity,
        containerCssClass: 'select-xs',
        width: 230
    });
 
</script>  

