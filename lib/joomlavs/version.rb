# This file is part of JoomlaVS.

# JoomlaVS is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.

# JoomlaVS is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.

# You should have received a copy of the GNU General Public License
# along with JoomlaVS.  If not, see <http://www.gnu.org/licenses/>.

module JoomlaVS
  module Version
    def determine_joomla_version_from_meta_tags
      print_verbose('Searching for version in meta data...')
      @joomla_version = fingerprint_scanner.version_from_meta_tag

      if joomla_version
        print_good("Joomla version #{@joomla_version} identified from meta data")
        @component_scan = true
      else
        print_verbose('No version found in the meta data')
        @component_scan = false
      end
    end

    def determine_joomla_version_from_readme
      print_verbose('Searching for version in README.txt...')
      @joomla_version = fingerprint_scanner.version_from_readme
      if joomla_version
        print_good("Joomla version #{@joomla_version} identified from README.txt")
        @component_scan = true
      else
        print_verbose('No version found in README.txt')
        @component_scan = false
      end
    end

    def determine_joomla_running
      print_verbose('Searching for version in README.txt...')
      @component_scan = fingerprint_scanner.joomla_from_meta_tag
      @component_scan = fingerprint_scanner.joomla_from_script_tag unless @component_scan
      if component_scan
        print_good("Site is running Joomla. Version can't be determined")
      else
        print_verbose('Site is not running Joomla')
      end
    end

    def determine_joomla_version
      print_line_break
      print_verbose('Determining Joomla version...')
      determine_joomla_version_from_readme
      determine_joomla_version_from_meta_tags unless @joomla_version
      determine_joomla_running unless @joomla_version
      print_error('Couldn\'t determine version') unless joomla_version || component_scan
    end
  end
end
