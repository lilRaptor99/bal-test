import ballerina/http;

type Citizen record {
    string id;
    string first_name;
    string middle_names;
    string last_name;
    string gender;
    string dob;
    string address;
};

public listener http:Listener httpListener = new (8080);

service / on httpListener {
    resource function get health() returns string {
        return "OK";
    }

    resource function get citizens() returns Citizen[]|http:Conflict {
        return getAllCitizenData();
    }

    resource function get citizen/[string id]() returns Citizen|http:NotFound {
        Citizen? citizen = getCitizenData(id);

        if (citizen is null) {
            http:NotFound err = {body: {"error": "Id number not found"}};
            return err;
        }

        return citizen;
    }

}

table<Citizen> citizenData = table [
    {id: "992383845V", first_name: "Pratheek", middle_names: "", last_name: "Senevirathne", dob: "1999-08-26", gender: "M", address: "200/4, 1st Lane, Rajagiriya"},
    {id: "990012912V", first_name: "Jolene", middle_names: "", last_name: "Robelin", dob: "1999-07-20", gender: "F", address: "587 Prairieview Plaza"},
    {id: "995619139V", first_name: "Angy", middle_names: "", last_name: "Boulter", dob: "1999-07-06", gender: "F", address: "4 Ramsey Circle"},
    {id: "992939283V", first_name: "Elton", middle_names: "", last_name: "Barenskie", dob: "1999-12-30", gender: "M", address: "38712 Northfield Park"},
    {id: "994789346V", first_name: "Anette", middle_names: "", last_name: "Comiskey", dob: "1999-01-02", gender: "F", address: "8 Cordelia Lane"},
    {id: "991777277V", first_name: "Drew", middle_names: "", last_name: "Fowle", dob: "1999-04-07", gender: "M", address: "3 Algoma Way"}
];

function getAllCitizenData() returns Citizen[] {
    return citizenData.toArray();
}

function getCitizenData(string id) returns Citizen? {

    Citizen[] matchedCitizens = from Citizen citizen in citizenData
        where citizen.id == id
        select citizen;

    return matchedCitizens.length() > 0 ? matchedCitizens[0] : null;
}
