package pl.coderslab.addins;

/*import com.microsoft.azure.cognitiveservices.search.imagesearch.BingImageSearchAPI;
import com.microsoft.azure.cognitiveservices.search.imagesearch.BingImageSearchManager;
import com.microsoft.azure.cognitiveservices.search.imagesearch.models.ImageObject;
import com.microsoft.azure.cognitiveservices.search.imagesearch.models.ImagesModel;*/

import java.net.*;
import java.util.*;
import java.io.*;
import javax.net.ssl.HttpsURLConnection;

import com.google.gson.*;

public class PicSearch {

    // ***********************************************
// *** Update or verify the following values. ***
// **********************************************

    // Replace the subscriptionKey string value with your valid subscription key.
    static String subscriptionKey = "8faf7ecaf55a4ea683954488a05ebfd1";

    // Verify the endpoint URI.  At this writing, only one endpoint is used for Bing
    // search APIs.  In the future, regional endpoints may be available.  If you
    // encounter unexpected authorization errors, double-check this value against
    // the endpoint for your Bing Web search instance in your Azure dashboard.
    static String host = "https://api.cognitive.microsoft.com";
    static String path = "/bing/v7.0/images/search";

    static String searchTerm = "tropical ocean";

    public static SearchResults SearchImages(String searchQuery) throws Exception {
        // construct URL of search request (endpoint + query string)
        URL url = new URL(host + path + "?q=" + URLEncoder.encode(searchQuery, "UTF-8"));
        HttpsURLConnection connection = (HttpsURLConnection) url.openConnection();
        connection.setRequestProperty("Ocp-Apim-Subscription-Key", subscriptionKey);

        // receive JSON body
        InputStream stream = connection.getInputStream();
        String response = new Scanner(stream).useDelimiter("\\A").next();

        // construct result object for return
        SearchResults results = new SearchResults(new HashMap<String, String>(), response);

        // extract Bing-related HTTP headers
        Map<String, List<String>> headers = connection.getHeaderFields();
        for (String header : headers.keySet()) {
            if (header == null) continue;      // may have null key
            if (header.startsWith("BingAPIs-") || header.startsWith("X-MSEdge-")) {
                results.relevantHeaders.put(header, headers.get(header).get(0));
            }
        }

        stream.close();
        return results;
    }

    // pretty-printer for JSON; uses GSON parser to parse and re-serialize
    public static String prettify(String json_text) {
        JsonParser parser = new JsonParser();
        JsonObject json = parser.parse(json_text).getAsJsonObject();
        Gson gson = new GsonBuilder().setPrettyPrinting().create();
        return gson.toJson(json);
    }

    public static String findUrl(String keyword) {
        if (subscriptionKey.length() != 32) {
            System.out.println("Invalid Bing Search API subscription key!");
            System.out.println("Please paste yours into the source code.");
            System.exit(1);
        }

        try {
            System.out.println("Searching the Web for: " + keyword);

            SearchResults result = SearchImages(keyword);
            //uncomment this section to see the HTTP headers

            System.out.println("\nRelevant HTTP Headers:\n");
            for (String header : result.relevantHeaders.keySet())
                System.out.println(header + ": " + result.relevantHeaders.get(header));


            System.out.println("\nJSON Response:\n");
            //parse the json
            JsonParser parser = new JsonParser();
            JsonObject json = parser.parse(result.jsonResponse).getAsJsonObject();
            //get the first image result from the JSON object, along with the total
            //number of images returned by the Bing Image Search API.
            String total = json.get("totalEstimatedMatches").getAsString();
            JsonArray results = json.getAsJsonArray("value");
            JsonObject first_result = (JsonObject) results.get(0);
            String resultURL = first_result.get("thumbnailUrl").getAsString();

            System.out.println("\nThe total number of images found: " + total + "\n");
            System.out.println("\nThe thumbnail URL to the first image search URL: " + resultURL + "\n");
            return resultURL;

        } catch (Exception e) {
            e.printStackTrace(System.out);
            return " ";
        }

    }
}

    /*public static void main (String[] args) {
        if (subscriptionKey.length() != 32) {
            System.out.println("Invalid Bing Search API subscription key!");
            System.out.println("Please paste yours into the source code.");
            System.exit(1);
        }

        try {
            System.out.println("Searching the Web for: " + searchTerm);

            SearchResults result = SearchImages(searchTerm);
            //uncomment this section to see the HTTP headers

            System.out.println("\nRelevant HTTP Headers:\n");
            for (String header : result.relevantHeaders.keySet())
            System.out.println(header + ": " + result.relevantHeaders.get(header));


            System.out.println("\nJSON Response:\n");
            //parse the jseon
            JsonParser parser = new JsonParser();
            JsonObject json = parser.parse(result.jsonResponse).getAsJsonObject();
            //get the first image result from the JSON object, along with the total
            //number of images returned by the Bing Image Search API.
            String total = json.get("totalEstimatedMatches").getAsString();
            JsonArray results = json.getAsJsonArray("value");
            JsonObject first_result = (JsonObject)results.get(0);
            String resultURL = first_result.get("thumbnailUrl").getAsString();

            System.out.println("\nThe total number of images found: "+ total +"\n");
            System.out.println("\nThe thumbnail URL to the first image search URL: "+ resultURL +"\n");

        }
        catch (Exception e) {
            e.printStackTrace(System.out);
            System.exit(1);
        }
    }*/


// Container class for search results encapsulates relevant headers and JSON data
class SearchResults{
    HashMap<String, String> relevantHeaders;
    String jsonResponse;
    SearchResults(HashMap<String, String> headers, String json) {
        relevantHeaders = headers;
        jsonResponse = json;
    }
    }








    /*public static void main(String[] args) {
        System.out.println(getPictureUrl("Focal Elear"));

    }*/

   /* public static String getPictureUrl(String searchTerm){
        final String subscriptionKey = "8faf7ecaf55a4ea683954488a05ebfd1";
        BingImageSearchAPI client = BingImageSearchManager.authenticate(subscriptionKey);
        ImagesModel imageResults = client.bingImages().search() .withQuery(searchTerm) .withMarket("en-us") .execute();
        if (imageResults != null && imageResults.value().size() > 0) {
            // Image results
            ImageObject firstImageResult = imageResults.value().get(0);

            System.out.println(String.format("Total number of images found: %d", imageResults.value().size()));
            System.out.println(String.format("First image thumbnail url: %s", firstImageResult.thumbnailUrl()));
            System.out.println(String.format("First image content url: %s", firstImageResult.contentUrl()));
            return firstImageResult.contentUrl();
        }
        else {
            System.out.println("Couldn't find image results!");
            return " ";
        }
    }*/



