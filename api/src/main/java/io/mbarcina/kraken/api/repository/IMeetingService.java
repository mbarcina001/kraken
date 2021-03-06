package io.mbarcina.kraken.api.repository;

import java.util.List;

import org.springframework.security.oauth2.provider.OAuth2Authentication;

import io.mbarcina.kraken.api.entity.Meeting;
import io.mbarcina.kraken.api.exception.DAOException;
import io.mbarcina.kraken.api.response.ApiResponse;

public interface IMeetingService {
	
	public ApiResponse<List<Meeting>> getUserMeetingList(OAuth2Authentication pAuthentication) throws DAOException;
	public ApiResponse<List<Meeting>> createMeeting(OAuth2Authentication pAuthentication, Meeting pMeeting) throws DAOException;
	public ApiResponse<List<Meeting>> editMeeting(OAuth2Authentication pAuthentication, Meeting pMeeting) throws DAOException;
	public ApiResponse<List<Meeting>> deleteMeeting(OAuth2Authentication pAuthentication, int pMeetingId) throws DAOException;

}
