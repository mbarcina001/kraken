import { createAction, props } from '@ngrx/store';
import { Meeting } from '../models/meeting.model';
import { ACTION_MEETING_GET_MEETINGS, ACTION_MEETING_GET_MEETINGS_SUCCESS, ACTION_MEETING_GET_MEETINGS_ERROR, ACTION_MEETING_CREATE_MEETING,
    ACTION_MEETING_CREATE_MEETING_SUCCESS, ACTION_MEETING_CREATE_MEETING_ERROR, ACTION_MEETING_EDIT_MEETING,
    ACTION_MEETING_EDIT_MEETING_SUCCESS, ACTION_MEETING_EDIT_MEETING_ERROR, ACTION_MEETING_DELETE_MEETING,
    ACTION_MEETING_DELETE_MEETING_SUCCESS, ACTION_MEETING_DELETE_MEETING_ERROR } from '../store.constants';

export const getUserMeetings = createAction(ACTION_MEETING_GET_MEETINGS);
export const getUserMeetingsSuccess = createAction(ACTION_MEETING_GET_MEETINGS_SUCCESS, props<{meetings: Meeting[]}>());
export const getUserMeetingsError = createAction(ACTION_MEETING_GET_MEETINGS_ERROR, props<{error: any}>());

export const createMeeting = createAction(ACTION_MEETING_CREATE_MEETING, props<{meeting: Meeting}>());
export const createMeetingSuccess = createAction(ACTION_MEETING_CREATE_MEETING_SUCCESS, props<{meetings: Meeting[]}>());
export const createMeetingError = createAction(ACTION_MEETING_CREATE_MEETING_ERROR, props<{error: any}>());

export const editMeeting = createAction(ACTION_MEETING_EDIT_MEETING, props<{meeting: Meeting}>());
export const editMeetingSuccess = createAction(ACTION_MEETING_EDIT_MEETING_SUCCESS, props<{meetings: Meeting[]}>());
export const editMeetingError = createAction(ACTION_MEETING_EDIT_MEETING_ERROR, props<{error: any}>());

export const deleteMeeting = createAction(ACTION_MEETING_DELETE_MEETING, props<{meeting: Meeting}>());
export const deleteMeetingSuccess = createAction(ACTION_MEETING_DELETE_MEETING_SUCCESS, props<{meetings: Meeting[]}>());
export const deleteMeetingError = createAction(ACTION_MEETING_DELETE_MEETING_ERROR, props<{error: any}>());
