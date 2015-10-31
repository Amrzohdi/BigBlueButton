# This file is part of Mconf-Web, a web application that provides access
# to the Mconf webconferencing system. Copyright (C) 2010-2015 Mconf.
#
# This file is licensed under the Affero General Public License version
# 3 or later. See the LICENSE file.

class CustomBigbluebuttonRecordingsController < Bigbluebutton::RecordingsController
  # need authentication except to play a record (#1675)


  before_filter :set_parameters, only: :play

  protected

  # Checks the URL and sets the parameters as temporary parameters in the playback's URL.
  def set_parameters
  end

  # Override the method used in Bigbluebutton::RecordingsController to get the parameters the
  # user is allowed to use on update/create. Normal users can only update a few of the parameters
  # of a recording.
  def recording_allowed_params

  end
end
