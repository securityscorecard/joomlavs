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
  module Templates
    def templates_filter
      return [] unless opts[:quiet]
      templates = fingerprint_scanner.extract_templates_from_home
      
      if fingerprint_scanner.templates_listing_enabled
        templates |= fingerprint_scanner.extract_templates_from_index
      end

      if fingerprint_scanner.administrator_templates_listing_enabled
        templates |= fingerprint_scanner.extract_templates_from_admin_index
      end

      return nil if templates.empty?
      templates
    end

    def check_template_indexes
      if fingerprint_scanner.administrator_templates_listing_enabled
        print_warning("Templates listing enabled: #{fingerprint_scanner.target_uri}/administrator/templates")
      end

      if fingerprint_scanner.templates_listing_enabled
        print_warning("Templates listing enabled: #{fingerprint_scanner.target_uri}/templates")
      end
    end

    def scan_templates
      return unless opts[:scan_all] || opts[:scan_templates]
      scanner = TemplateScanner.new(target, opts)
      print_line_break
      print_good('Scanning for vulnerable templates...')
      templates = scanner.scan(templates_filter)
      print_warning("Found #{templates.length} vulnerable templates.")
      print_line_break
      print_horizontal_rule
      templates.each { |t| display_detected_extension(t) }
    end
  end
end