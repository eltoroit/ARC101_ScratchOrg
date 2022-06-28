@RestResource(urlMapping='/calculator/*')
global with sharing class WS_Rest {
	@HttpPost
	global static Integer posttAdd(Integer i, Integer j) {
		return i + j;
	}

	@HttpGet
	global static Integer getAdd() {
		RestRequest req = RestContext.request;
		Map<String, String> params = req.params;
		Integer i = Integer.valueOf(params.get('i'));
		Integer j = Integer.valueOf(params.get('j'));
		return i + j;
	}
}
