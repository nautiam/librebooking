<?php
/**
Copyright 2012 Nick Korbel

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
 */

require_once(ROOT_DIR . 'Pages/Ajax/ReservationSavePage.php');

class FakeReservationSavePage implements IReservationSavePage
{
	public $userId = 110;
	public $resourceId = 120;
	public $scheduleId = 123;
	public $title = 'title';
	public $description = 'description';
	public $startDate = '2010-01-01';
	public $endDate = '2010-01-02';
	public $startTime = '05:30';
	public $endTime = '04:00';
	public $resourceIds = array(11, 22, 120);
	public $repeatType = RepeatType::Daily;
	public $repeatInterval = 2;
	public $repeatWeekdays = array(0, 1, 2);
	public $repeatMonthlyType = RepeatMonthlyType::DayOfMonth;
	public $repeatTerminationDate = '2010-10-10';
	public $saveSuccessful = false;
	public $errors = array();
	public $warnings = array();
	public $referenceNumber;
	public $participants = array(10, 20, 40);
	public $invitees = array(11, 21, 41);
	public $accessories = array();
	public $attributes = array();
	public $attachment;
	public $startReminderValue = "15";
	public $startReminderInterval = ReservationReminderInterval::Minutes;
	public $endReminderValue = "1";
	public $endReminderInterval = ReservationReminderInterval::Hours;
	public $hasEndReminder = true;

	public function __construct()
	{
		$now = Date::Now();
		$this->startDate = $now->AddDays(5)->Format('Y-m-d');
		$this->endDate = $now->AddDays(6)->Format('Y-m-d');
		$this->repeatTerminationDate = $now->AddDays(60)->Format('Y-m-d');
		$this->accessories = array(new FakeAccessoryFormElement(1, 2, 'accessoryname'));
		$this->attributes = array(new AttributeFormElement(1, "something"));
		$this->attachment = new FakeUploadedFile();
	}

	public function GetUserId()
	{
		return $this->userId;
	}

	public function GetResourceId()
	{
		return $this->resourceId;
	}

	public function GetScheduleId()
	{
		return $this->scheduleId;
	}

	public function GetTitle()
	{
		return $this->title;
	}

	public function GetDescription()
	{
		return $this->description;
	}

	public function GetStartDate()
	{
		return $this->startDate;
	}

	public function GetEndDate()
	{
		return $this->endDate;
	}

	public function GetStartTime()
	{
		return $this->startTime;
	}

	public function GetEndTime()
	{
		return $this->endTime;
	}

	public function GetResources()
	{
		return $this->resourceIds;
	}

	public function GetRepeatType()
	{
		return $this->repeatType;
	}

	public function GetRepeatInterval()
	{
		return $this->repeatInterval;
	}

	public function GetRepeatWeekdays()
	{
		return $this->repeatWeekdays;
	}

	public function GetRepeatMonthlyType()
	{
		return $this->repeatMonthlyType;
	}

	public function GetRepeatTerminationDate()
	{
		return $this->repeatTerminationDate;
	}

	public function SetSaveSuccessfulMessage($succeeded)
	{
		$this->saveSuccessful = $succeeded;
	}

	public function SetReferenceNumber($referenceNumber)
	{
		$this->referenceNumber = $referenceNumber;
	}

	public function ShowErrors($errors)
	{
		$this->errors = $errors;
	}

	public function ShowWarnings($warnings)
	{
		$this->warnings = $warnings;
	}

	public function GetParticipants()
	{
		return $this->participants;
	}

	public function GetInvitees()
	{
		return $this->invitees;
	}

	public function GetAttachments()
	{
		return array($this->attachment);
	}

	/**
	 * @return AccessoryFormElement[]
	 */
	public function GetAccessories()
	{
		return $this->accessories;
	}

	/**
	 * @return AttributeFormElement[]|array
	 */
	public function GetAttributes()
	{
		return $this->attributes;
	}

	public function GetStartReminderValue()
	{
		return $this->startReminderValue;
	}

	public function GetStartReminderInterval()
	{
		return $this->startReminderInterval;
	}

	public function GetEndReminderValue()
	{
		return $this->endReminderValue;
	}

	public function GetEndReminderInterval()
	{
		return $this->endReminderInterval;
	}

	public function HasStartReminder()
	{
		return true;
	}

	public function HasEndReminder()
	{
		return $this->hasEndReminder;
	}
}

class FakeAccessoryFormElement extends AccessoryFormElement
{
	public function __construct($id, $quantity, $name)
	{
		$this->Id = $id;
		$this->Quantity = $quantity;
		$this->Name = $name;
	}
}
?>