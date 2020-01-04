/*
 * cache.h - cache functionalities for proxy server of SNU proxy lab
 * Author: Jiwong Ko
 * Email: jiwong@csap.snu.ac.kr
 */

#include <stdio.h>

#define MAX_OBJECT_SIZE 200000 // 200kB is maximum for one requests
#define MAX_CACHE_SIZE 1000000 // MAX CACHE SIZE should be 1MB
#define URI_SIZE 1024
#define RESP_SIZE 1024

typedef struct cache_block
{
	/* 
	 * cache block needs to contain 
	 * 1. URI (recommend to use key value)
	 * 2. response header
	 * 3. contents
	 * 4. size of contents
	 * 5. others
	 */
	char *request_uri;
	char *response_header;
	char *response_content;
	int content_length;
	struct chche_block *next;
} cache_block;

/// cache function prototypes
int search_cache_block(cache_block *dummy_header, char *uri);
int cache_replacement_policy(cache_block *dummy_header);
cache_block *add_cache_block(cache_block *dummy_header, char *uri, char *response_header, int contentLength);
