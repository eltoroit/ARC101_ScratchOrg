/*
String code = '1.1';
ExternalService.Quotes_Quote quote;
quote = Quotes.createQuote('q' + code, 'a' + code);
System.debug(quote);

quote = Quotes.getQuoteById(quote.Id);
System.debug(quote);

code = '1.2';
quote.quote = 'q' + code;
quote.author = 'a' + code;
quote = Quotes.updateQuoteById(quote.Id, quote.quote, quote.author);
System.debug(quote);

Quotes.deleteQuoteById(quote.Id);

Quotes.isPrint = false;
List<ExternalService.Quotes_Quote> quotesOut;
quotesOut = Quotes.getAllQuotes();
for (ExternalService.Quotes_Quote quoteToDelete : quotesOut) {
    if (quoteToDelete.Id > 18) {
        System.debug('Delete #' + quoteToDelete.Id);
        Quotes.deleteQuoteById(quoteToDelete.Id);
    }
}
*/



public class Quotes {
	public static boolean isPrint = true;

	public static List<ExternalService.Quotes_Quote> getAllQuotes() {
		ExternalService.Quotes quotesService = new ExternalService.Quotes();
		try {
			ExternalService.Quotes.getAllQuotes_Response response = quotesService.getAllQuotes();
			List<ExternalService.Quotes_Quote> quotesOut = response.code200;
			for (ExternalService.Quotes_Quote quoteOut : quotesOut) {
				printQuote(quoteOut);
			}
			return quotesOut;
		} catch (ExternalService.Quotes.getAllQuotes_ResponseException ex) {
			System.debug('EXPECTED EXCEPTION');
			System.debug(ex);
			return null;
		} catch (EXception ex) {
			System.debug('OTHER EXCEPTION');
			System.debug(ex);
			return null;
		}
	}

	public static ExternalService.Quotes_Quote getQuoteById(Integer quoteId) {
		ExternalService.Quotes quotesService = new ExternalService.Quotes();
		try {
			ExternalService.Quotes.getQuoteById_Request request = new ExternalService.Quotes.getQuoteById_Request();
			request.id = quoteId;
			ExternalService.Quotes.getQuoteById_Response response = quotesService.getQuoteById(request);
			ExternalService.Quotes_Quote quoteOut = response.code200;
			printQuote(quoteOut);
			return quoteOut;
		} catch (ExternalService.Quotes.getQuoteById_ResponseException ex) {
			System.debug('EXPECTED EXCEPTION');
			System.debug(ex);
			if (ex.responseCode == 404) {
				System.debug('Quote not found');
				System.debug(ex.Code404);
			} else if (ex.responseCode == 500) {
				System.debug('Server Error');
				System.debug(ex.Code500);
			}
			return null;
		} catch (EXception ex) {
			System.debug('OTHER EXCEPTION');
			System.debug(ex);
			return null;
		}
	}

	public static ExternalService.Quotes_Quote createQuote(String quote, String author) {
		ExternalService.Quotes quotesService = new ExternalService.Quotes();
		try {
			ExternalService.Quotes_Quote quoteIn = new ExternalService.Quotes_Quote();
			quoteIn.author = author;
			quoteIn.quote = quote;
			ExternalService.Quotes.createQuote_Request request = new ExternalService.Quotes.createQuote_Request();
			request.body = quoteIn;
			ExternalService.Quotes.createQuote_Response response = quotesService.createQuote(request);
			ExternalService.Quotes_Quote quoteOut = response.code200;
			printQuote(quoteOut);
			return quoteOut;
		} catch (ExternalService.Quotes.createQuote_ResponseException ex) {
			System.debug('EXPECTED EXCEPTION');
			System.debug(ex);
			return null;
		} catch (EXception ex) {
			System.debug('OTHER EXCEPTION');
			System.debug(ex);
			return null;
		}
	}

	public static ExternalService.Quotes_Quote updateQuoteById(Integer quoteId, String quote, String author) {
		ExternalService.Quotes quotesService = new ExternalService.Quotes();
		try {
			ExternalService.Quotes_Quote quoteIn = new ExternalService.Quotes_Quote();
			quoteIn.author = author;
			quoteIn.quote = quote;
			ExternalService.Quotes.updateQuoteById_Request request = new ExternalService.Quotes.updateQuoteById_Request();
			request.id = quoteId;
			request.body = quoteIn;
			ExternalService.Quotes.updateQuoteById_Response response = quotesService.updateQuoteById(request);
			System.debug(response);
			ExternalService.Quotes_Quote quoteOut = response.code200;
			printQuote(quoteOut);
			return quoteOut;
		} catch (ExternalService.Quotes.updateQuoteById_ResponseException ex) {
			System.debug('EXPECTED EXCEPTION');
			System.debug(ex);
			return null;
		} catch (EXception ex) {
			System.debug('OTHER EXCEPTION');
			System.debug(ex);
			return null;
		}
	}

	public static Boolean deleteQuoteById(Integer quoteId) {
		ExternalService.Quotes quotesService = new ExternalService.Quotes();
		try {
			ExternalService.Quotes.deleteQuoteById_Request request = new ExternalService.Quotes.deleteQuoteById_Request();
			request.id = quoteId;
			ExternalService.Quotes.deleteQuoteById_Response response = quotesService.deleteQuoteById(request);
			System.debug(response.code200);
			return true;
		} catch (ExternalService.Quotes.deleteQuoteById_ResponseException ex) {
			System.debug('EXPECTED EXCEPTION');
			System.debug(ex);
			if (ex.responseCode == 404) {
				System.debug('Quote not found');
				System.debug(ex.Code404);
			} else if (ex.responseCode == 500) {
				System.debug('Server Error');
				System.debug(ex.Code500);
			}
			return false;
		} catch (EXception ex) {
			System.debug('OTHER EXCEPTION');
			System.debug(ex);
			return false;
		}
	}

	private static void printQuote(ExternalService.Quotes_Quote quoteOut) {
		if (isPrint) {
			System.debug('---');
			System.debug('#' + quoteOut.id + '. ' + quoteOut.quote);
			System.debug('By: ' + quoteOut.author);
		}
	}
}
