require "mongo"

Mongo::Logger.logger = Logger.new("./logs/mongo.log")

class MongoDb
    def remove_spot(company, user_id)
        spots.delete_many({company: company, user: user_id.to_mongo_id })
    end

    def remove_my_spots(user_id)
        spots.delete_many({ user: user_id.to_mongo_id })
    end

    private

    # retorna a collection
    def spots
        return client[:spots]
    end

    def client
        str_conn = "mongodb://qaninja:qaninja123@ds035664.mlab.com:35664/spotdb?retryWrites=false"
        return Mongo::Client.new(str_conn)
    end
end

