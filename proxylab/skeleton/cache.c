#include "cache.h"

/// you can use any data structures like linked-list, tree and hash table

int cache_replacement_policy(cache_block *dummy_header)
{
	/*
 * cache_replacement_policy: 
 * 			delete the cached contents according to the cache replacement policy
 * params:
 *
 */
	int cache_size;
	cache_block *next = dummy_header->next;

	dummy_header->next = next->next;
	cache_size = sizeof(char) * strlen(next->request_uri) + sizeof(char) * strlen(next->response_header) + sizeof(char) * (next->content_length) + sizeof(int);

	free(next->request_uri);

	free(next->response_header);

	free(next->response_content);

	free(next);
	return cache_size;
}

cache_block *add_cache_block(cache_block *dummy_header, char *uri, char *response, int contentLength)
{
	/*
 * add_cache_block: 
 *        add the uri information into the proxy cache 
 * params:
 *    - uri: uri string.
 *    - content: the content of uri
 *    - response: response header 
 *    - contentLength: byte length of the HTTP body
 * 
 */
	/// use cache replacement policy if the proxy cache is full.
	/// you can use any cache replacement policy such as FIFO, LRU
	cache_block *new_block = Malloc(sizeof(*new_block));
	new_block->request_uri = Malloc(sizeof(char) * strlen(uri)) + 1;
	new_block->response_header = Malloc(sizeof(char) * strlen(response) + 1);
	new_block->response_content = Malloc(sizeof(char) * contentLength + 1);
	// new_block->content_length = Malloc(sizeof(int));
	new_block->next = NULL;

	memcpy(new_block->request_uri, uri, strlen(uri));
	memcpy(new_block->response_header, response, strlen(response));
	new_block->content_length = contentLength;

	while (dummy_header->next != NULL)
	{
		dummy_header = dummy_header->next;
	}

	dummy_header->next = new_block;
	return new_block;
}

int search_cache_block(cache_block *dummy_header, char *uri)
{
	int cnt = 0;
	if (dummy_header->next == NULL)
	{
		return 0;
	}
	while (dummy_header->next != NULL)
	{
		cnt++;
		dummy_header = dummy_header->next;
		if (!strcmp(dummy_header->request_uri, uri))
		{
			return cnt;
		}
	}
	return 0;
}
