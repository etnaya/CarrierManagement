const cds = require("@sap/cds");

module.exports = cds.service.impl(async function() {
    const { Carriers, Credits, Countries } = this.entities;

    this.after("READ", Carriers, (data) => {
        const carriers = Array.isArray(data) ? data : [data];

        carriers.forEach((carrier) => {
            if (carrier.schedules >= 5) {
                carrier.criticality = 3;
            } else {
                carrier.criticality = 1;
            }
        });
    });

    const CountrySrv = await cds.connect.to("API_COUNTRY_SRV");

    this.on("READ", Countries, async (req) => {
        return await CountrySrv.transaction(req).send({
            query: req.query,
            headers: {
                apikey: process.env.apikey
            }
        });
    });  
});
