# This file is part of Mconf-Web, a web application that provides access
# to the Mconf webconferencing system. Copyright (C) 2010-2015 Mconf.
#
# This file is licensed under the Affero General Public License version
# 3 or later. See the LICENSE file.

class CustomBigbluebuttonRoomsController < Bigbluebutton::RoomsController

  def determine_layout
  end

  def check_redirect_to_invite
  end

  def check_redirect_to_invite_userid
  end

  def join_options
  end

  def invitation
  end

  def send_invitation
  end

  protected

  # Loads the room and fetches information from the web conference server.
  def load_and_fetch_room_info
  end

  # Converts the date submitted from a datetimepicker to a DateTime.
  # These dates were configured by the user in the view assuming his time zone, so we need to set
  # this time zone in the object before parsing it.
  def adjust_dates_for_invitation(params)
  end

  # Redirects the user elsewhere if the room exceeds the user limit defined in the room.
  # This check won't be made when the room is being created.
  # Note: Solves the problem but it's not perfect. Has concurrency problems if users try to join
  # simultaneously, before the webconf server has updated the number of participants to return
  # in the API. Ideally BBB should enforce max_participants is respected.
  def check_user_limit
  end

  def set_site_pattern
  end

  # For cancan create load_and_authorize
  def create_params
  end

  # Override the method used in Bigbluebutton::RoomsController to get the parameters the user is
  # allowed to use on update/create. Normal users can only update a few of the parameters of a room.
  def room_allowed_params
  end
end
