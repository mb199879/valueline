package com.valueline.module.webapi.rs.order;

import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.QueryParam;
import javax.ws.rs.core.MediaType;

@Produces({MediaType.APPLICATION_JSON})
public interface IRestBuyOrderService {
	@GET
    @Path("/queryBuyOrder")
	public String queryOrderById(@QueryParam("id") int id);

}
