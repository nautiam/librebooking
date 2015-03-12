{*
Copyright 2011-2014 Nick Korbel

This file is part of Booked Scheduler.

Booked Scheduler is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

Booked Scheduler is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with Booked Scheduler.  If not, see <http://www.gnu.org/licenses/>.
*}

{include file='globalheader.tpl' cssFiles="scripts/css/timePicker.css"}
<div class="page-manage-blackouts">
<h1>{translate key=ManageBlackouts}</h1>

<form id="addBlackoutForm" class="form-inline" role="form" method="post">
	<div class="panel panel-default" id="add-blackout-panel">
		<div class="panel-heading">{translate key="AddBlackout"} <a href=""><span class="show-hide glyphicon"></span></a></div>
		<div class="panel-body add-contents">

			<div class="form-group col-xs-6 col-sm-4">
				<label for="addStartDate">{translate key=BeginDate}</label>
				<input type="text" id="addStartDate" class="form-control dateinput inline-block "
					   value="{formatdate date=$AddStartDate}"/>
				<input {formname key=BEGIN_DATE} id="formattedAddStartDate" type="hidden"
												 value="{formatdate date=$AddStartDate key=system}"/>
				<input {formname key=BEGIN_TIME} type="text" id="addStartTime"
												 class="form-control dateinput inline-block"
												 value="8:00 AM" title="Start time"/>
			</div>
			<div class="form-group col-xs-6 col-sm-4">
				<label for="addEndDate">{translate key=EndDate}</label>
				<input type="text" id="addEndDate" class="form-control dateinput inline-block " size="10"
					   value="{formatdate date=$AddEndDate}"/>
				<input {formname key=END_DATE} type="hidden" id="formattedAddEndDate"
											   value="{formatdate date=$AddEndDate key=system}"/>
				<input {formname key=END_TIME} type="text" id="addEndTime"
											   class="form-control dateinput inline-block"
											   value="9:00 AM"
											   title="End time"/>
			</div>
			<div class="form-group col-xs-12">
				<label for="addResourceId">{translate key=Resource}</label>
				<select {formname key=RESOURCE_ID} class="form-control" id="addResourceId">
					{object_html_options options=$Resources key='GetId' label="GetName" selected=$ResourceId}
				</select>
				{if $Schedules|count > 0}
					|
					<div class="checkbox">
						<input {formname key=BLACKOUT_APPLY_TO_SCHEDULE} type="checkbox" id="allResources"/>
						<label for="allResources" style="">{translate key=AllResourcesOn} </label>
					</div>
					<select {formname key=SCHEDULE_ID} id="addScheduleId" class="form-control" disabled="disabled"
													   title="Schedule">
						{object_html_options options=$Schedules key='GetId' label="GetName" selected=$ScheduleId}
					</select>
				{/if}
			</div>
			<div class="col-xs-12">
				<div class="form-group has-feedback">
					<label for="blackoutReason">{translate key=Reason}</label>
					<input {formname key=SUMMARY} type="text" id="blackoutReason" required
												  class="form-control required"/>
					<i class="glyphicon glyphicon-asterisk form-control-feedback" data-bv-icon-for="blackoutReason"></i>
				</div>
			</div>
			<div class="col-xs-12">
				{control type="RecurrenceControl" RepeatTerminationDate=$RepeatTerminationDate}
			</div>
			<div class="form-group col-xs-12">
				<div class="radio">
					<input {formname key=CONFLICT_ACTION} type="radio" id="notifyExisting"
														  name="existingReservations"
														  checked="checked"
														  value="{ReservationConflictResolution::Notify}"/>
					<label for="notifyExisting">{translate key=BlackoutShowMe}</label>
				</div>
				<div class="radio">
					<input {formname key=CONFLICT_ACTION} type="radio" id="deleteExisting"
														  name="existingReservations"
														  value="{ReservationConflictResolution::Delete}"/>
					<label for="deleteExisting">{translate key=BlackoutDeleteConflicts}</label>
				</div>
			</div>
		</div>
		<div class="panel-footer">
			<button type="button" class="btn btn-success btn-sm save create">
				<span class="glyphicon glyphicon-ok-circle"></span>
				{translate key='Create'}
			</button>
			<button type="reset" class="btn btn-default btn-sm">{translate key=Reset}</button>
		</div>
	</div>
</form>

<form class="form" role="form">
	<div class="panel panel-default">
		<div class="panel-heading">
			{translate key="Filter"}
		</div>
		<div class="panel-body">
			<div class="form-group col-xs-4">
				<input id="startDate" type="text" class="form-control dateinput inline-block"
					   value="{formatdate date=$StartDate}"
					   title="Between start date" placeholder="{translate key=BeginDate}"/>
				<input id="formattedStartDate" type="hidden" value="{formatdate date=$StartDate key=system}"/>
				-
				<input id="endDate" type="text" class="form-control dateinput inline-block"
					   value="{formatdate date=$EndDate}" placeholder="{translate key=EndDate}"/>
				<input id="formattedEndDate" type="hidden" value="{formatdate date=$EndDate key=system}"/>
			</div>
			<div class="form-group col-xs-4">
				<select id="scheduleId" class="form-control col-xs-12">
					<option value="">{translate key=AllSchedules}</option>
					{object_html_options options=$Schedules key='GetId' label="GetName" selected=$ScheduleId}
				</select>
			</div>
			<div class="form-group col-xs-4">
				<select id="resourceId" class="form-control col-xs-12">
					<option value="">{translate key=AllResources}</option>
					{object_html_options options=$Resources key='GetId' label="GetName" selected=$ResourceId}
				</select>
			</div>
		</div>
		<div class="panel-footer">
			<button id="filter" class="btn btn-primary btn-sm"><span class="fa fa-search"></span> {translate key=Filter}
			</button>
			<button id="showAll" class="btn btn-link btn-sm">{translate key=ViewAll}</button>
		</div>
	</div>
</form>

<table class="table" id="blackoutTable">
	<thead>
	<tr>
		<th>{translate key=Resource}</th>
		<th>{translate key=BeginDate}</th>
		<th>{translate key=EndDate}</th>
		<th>{translate key=Reason}</th>
		<th>{translate key=CreatedBy}</th>
		<th>{translate key=Delete}</th>
	</tr>
	</thead>
	<tbody>
	{foreach from=$blackouts item=blackout}
		{cycle values='row0,row1' assign=rowCss}
		<tr class="{$rowCss} editable" data-blackout-id="{$blackout->InstanceId}">
			<td>{$blackout->ResourceName}</td>
			<td style="width:150px;">{formatdate date=$blackout->StartDate timezone=$Timezone key=res_popup}</td>
			<td style="width:150px;">{formatdate date=$blackout->EndDate timezone=$Timezone key=res_popup}</td>
			<td>{$blackout->Title}</td>
			<td style="max-width:150px;">{fullname first=$blackout->FirstName last=$blackout->LastName}</td>
			{if $blackout->IsRecurring}
				<td align="center" style="width: 65px;" class="update">
					<a href="#" class="update delete-recurring"><span class="fa fa-remove remove icon"></span></a>
				</td>
			{else}
				<td align="center" style="width: 65px;" class="update">
					<a href="#" class="update delete"><span class="fa fa-remove remove icon"></span></a>
				</td>
			{/if}
		</tr>
	{/foreach}
	</tbody>
</table>

{pagination pageInfo=$PageInfo}

<div id="deleteDialog" class="dialog" style="display:none;" title="{translate key=Delete}">
	<form id="deleteForm" method="post">
		<div class="error" style="margin-bottom: 25px;">
			<h3>{translate key=DeleteWarning}</h3>
		</div>
		<button type="button"
				class="button save btnUpdateAllInstances">{html_image src="cross-button.png"} {translate key='Delete'}</button>
		<button type="button" class="button cancel">{html_image src="slash.png"} {translate key='Cancel'}</button>
	</form>
</div>

<div id="deleteRecurringDialog" class="dialog" style="display:none;" title="{translate key=Delete}">
	<form id="deleteRecurringForm" method="post">
		<div class="error" style="margin-bottom: 25px;">
			<h3>{translate key=DeleteWarning}</h3>
		</div>
		<button type="button"
				class="button save btnUpdateThisInstance">{html_image src="cross-button.png"} {translate key='ThisInstance'}</button>
		<button type="button"
				class="button save btnUpdateAllInstances">{html_image src="cross-button.png"} {translate key='AllInstances'}</button>
		<button type="button" class="button cancel">{html_image src="slash.png"} {translate key='Cancel'}</button>
		<input type="hidden" {formname key=SERIES_UPDATE_SCOPE} class="hdnSeriesUpdateScope"
			   value="{SeriesUpdateScope::FullSeries}"/>
	</form>
</div>

{jsfile src="js/jquery.timePicker.min.js"}

{jsfile src="reservationPopup.js"}

{jsfile src="admin/edit.js"}
{jsfile src="admin/blackouts.js"}

{jsfile src="date-helper.js"}
{jsfile src="recurrence.js"}

<script type="text/javascript">

	$(document).ready(function ()
	{

		var updateScope = {};
		updateScope.instance = '{SeriesUpdateScope::ThisInstance}';
		updateScope.full = '{SeriesUpdateScope::FullSeries}';
		updateScope.future = '{SeriesUpdateScope::FutureInstances}';

		var actions = {};

		var blackoutOpts = {
			scopeOpts: updateScope,
			actions: actions,
			deleteUrl: '{$smarty.server.SCRIPT_NAME}?action={ManageBlackoutsActions::DELETE}&{QueryStringKeys::BLACKOUT_ID}=',
			addUrl: '{$smarty.server.SCRIPT_NAME}?action={ManageBlackoutsActions::ADD}',
			editUrl: '{$smarty.server.SCRIPT_NAME}?action={ManageBlackoutsActions::LOAD}&{QueryStringKeys::BLACKOUT_ID}=',
			updateUrl: '{$smarty.server.SCRIPT_NAME}?action={ManageBlackoutsActions::UPDATE}',
			reservationUrlTemplate: "{$Path}reservation.php?{QueryStringKeys::REFERENCE_NUMBER}=[refnum]",
			popupUrl: "{$Path}ajax/respopup.php"
		};

		var recurOpts = {
			repeatType: '{$RepeatType}',
			repeatInterval: '{$RepeatInterval}',
			repeatMonthlyType: '{$RepeatMonthlyType}',
			repeatWeekdays: [{foreach from=$RepeatWeekdays item=day}{$day}, {/foreach}]
		};

		var recurElements = {
			beginDate: $('#formattedAddStartDate'),
			endDate: $('#formattedAddEndDate'),
			beginTime: $('#addStartTime'),
			endTime: $('#addEndTime')
		};

		var recurrence = new Recurrence(recurOpts, recurElements);
		recurrence.init();

		var blackoutManagement = new BlackoutManagement(blackoutOpts);
		blackoutManagement.init();

	});
</script>

{control type="DatePickerSetupControl" ControlId="startDate" AltId="formattedStartDate"}
{control type="DatePickerSetupControl" ControlId="endDate" AltId="formattedEndDate"}
{control type="DatePickerSetupControl" ControlId="addStartDate" AltId="formattedAddStartDate"}
{control type="DatePickerSetupControl" ControlId="addEndDate" AltId="formattedAddEndDate"}
{control type="DatePickerSetupControl" ControlId="EndRepeat" AltId="formattedEndRepeat"}

<div id="wait-box" class="wait-box">
	<div id="creatingNotification">
		<h3>
			{block name="ajaxMessage"}
				{translate key=CreatingReservation}
			{/block}
		</h3>
		{html_image src="reservation_submitting.gif"}
	</div>
	<div id="result"></div>
</div>

</div>
{include file='globalfooter.tpl'}
