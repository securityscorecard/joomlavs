# This file is part of Joomla VS.

# Joomla VS is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.

# Joomla VS is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.

# You should have received a copy of the GNU General Public License
# along with Joomla VS.  If not, see <http://www.gnu.org/licenses/>.

require 'spec_helper'

describe ModuleScanner do

  let(:target_uri) { 'http://localhost/' }
  let(:opts_user_agent) { 'Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.0' }

  before :each do
    @scanner = ModuleScanner.new(target_uri, {
      :user_agent => opts_user_agent,
    })
  end

  describe '#possible_paths' do
    it 'returns two possible paths for the module to be found' do
      expect(@scanner.possible_paths('test').length).to eq 2
    end
  end
end