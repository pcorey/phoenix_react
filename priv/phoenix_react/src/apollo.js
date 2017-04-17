import ApolloClient, { createNetworkInterface } from "apollo-client";
import _ from "lodash";

const networkInterface = createNetworkInterface({
    uri: _.get(process.env, "REACT_APP_GRAPHQL_URL") || "http://localhost:4000/graphql",
    dataIdFromObject: object => object.id
});

export const client = new ApolloClient({
    networkInterface
});
