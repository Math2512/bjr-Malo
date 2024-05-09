class CreateGroupService
    def initialize(group_params, client_id)
        @group_params = group_params
        @client_id = client_id
    end

    def create_group
        group = Group.new(@group_params)
        group.client_id = @client_id
        if group.save
            true
        else
            false
        end
    rescue => e
        Rails.logger.error("Erreur lors de la création du groupe : #{e.message}")
        false
    end
end  