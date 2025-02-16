import 'dart:convert';

import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

/// Start OpenAI API Group Code

class OpenAIAPIGroup {
  static String getBaseUrl({
    String? apiKey,
  }) {
    apiKey ??= FFAppConstants.apiKeyOpenAi;
    return 'https://api.openai.com/v1';
  }

  static Map<String, String> headers = {
    'authorization': 'Bearer [apiKey]',
    'Content-Type': 'application/json',
    'OpenAI-Beta': 'assistants=v2',
  };
  static CreateChatCompletionCall createChatCompletionCall =
      CreateChatCompletionCall();
  static CreateStructuredChatCompletionCall createStructuredChatCompletionCall =
      CreateStructuredChatCompletionCall();
  static CreateCompletionCall createCompletionCall = CreateCompletionCall();
  static CreateImageCall createImageCall = CreateImageCall();
  static CreateImageEditCall createImageEditCall = CreateImageEditCall();
  static CreateImageVariationCall createImageVariationCall =
      CreateImageVariationCall();
  static CreateEmbeddingCall createEmbeddingCall = CreateEmbeddingCall();
  static CreateSpeechCall createSpeechCall = CreateSpeechCall();
  static CreateTranscriptionCall createTranscriptionCall =
      CreateTranscriptionCall();
  static CreateTranslationCall createTranslationCall = CreateTranslationCall();
  static ListFilesCall listFilesCall = ListFilesCall();
  static CreateFileCall createFileCall = CreateFileCall();
  static DeleteFileCall deleteFileCall = DeleteFileCall();
  static RetrieveFileCall retrieveFileCall = RetrieveFileCall();
  static DownloadFileCall downloadFileCall = DownloadFileCall();
  static CreateUploadCall createUploadCall = CreateUploadCall();
  static AddUploadPartCall addUploadPartCall = AddUploadPartCall();
  static CompleteUploadCall completeUploadCall = CompleteUploadCall();
  static CancelUploadCall cancelUploadCall = CancelUploadCall();
  static CreateFineTuningJobCall createFineTuningJobCall =
      CreateFineTuningJobCall();
  static ListPaginatedFineTuningJobsCall listPaginatedFineTuningJobsCall =
      ListPaginatedFineTuningJobsCall();
  static RetrieveFineTuningJobCall retrieveFineTuningJobCall =
      RetrieveFineTuningJobCall();
  static ListFineTuningEventsCall listFineTuningEventsCall =
      ListFineTuningEventsCall();
  static CancelFineTuningJobCall cancelFineTuningJobCall =
      CancelFineTuningJobCall();
  static ListFineTuningJobCheckpointsCall listFineTuningJobCheckpointsCall =
      ListFineTuningJobCheckpointsCall();
  static ListModelsCall listModelsCall = ListModelsCall();
  static RetrieveModelCall retrieveModelCall = RetrieveModelCall();
  static DeleteModelCall deleteModelCall = DeleteModelCall();
  static CreateModerationCall createModerationCall = CreateModerationCall();
  static ListAssistantsCall listAssistantsCall = ListAssistantsCall();
  static CreateAssistantCall createAssistantCall = CreateAssistantCall();
  static GetAssistantCall getAssistantCall = GetAssistantCall();
  static ModifyAssistantCall modifyAssistantCall = ModifyAssistantCall();
  static DeleteAssistantCall deleteAssistantCall = DeleteAssistantCall();
  static CreateThreadCall createThreadCall = CreateThreadCall();
  static GetThreadCall getThreadCall = GetThreadCall();
  static ModifyThreadCall modifyThreadCall = ModifyThreadCall();
  static DeleteThreadCall deleteThreadCall = DeleteThreadCall();
  static ListMessagesCall listMessagesCall = ListMessagesCall();
  static CreateMessageCall createMessageCall = CreateMessageCall();
  static GetMessageCall getMessageCall = GetMessageCall();
  static ModifyMessageCall modifyMessageCall = ModifyMessageCall();
  static DeleteMessageCall deleteMessageCall = DeleteMessageCall();
  static CreateThreadAndRunCall createThreadAndRunCall =
      CreateThreadAndRunCall();
  static ListRunsCall listRunsCall = ListRunsCall();
  static CreateRunCall createRunCall = CreateRunCall();
  static GetRunCall getRunCall = GetRunCall();
  static ModifyRunCall modifyRunCall = ModifyRunCall();
  static SubmitToolOuputsToRunCall submitToolOuputsToRunCall =
      SubmitToolOuputsToRunCall();
  static CancelRunCall cancelRunCall = CancelRunCall();
  static ListRunStepsCall listRunStepsCall = ListRunStepsCall();
  static GetRunStepCall getRunStepCall = GetRunStepCall();
  static ListVectorStoresCall listVectorStoresCall = ListVectorStoresCall();
  static CreateVectorStoreCall createVectorStoreCall = CreateVectorStoreCall();
  static GetVectorStoreCall getVectorStoreCall = GetVectorStoreCall();
  static ModifyVectorStoreCall modifyVectorStoreCall = ModifyVectorStoreCall();
  static DeleteVectorStoreCall deleteVectorStoreCall = DeleteVectorStoreCall();
  static ListVectorStoreFilesCall listVectorStoreFilesCall =
      ListVectorStoreFilesCall();
  static CreateVectorStoreFileCall createVectorStoreFileCall =
      CreateVectorStoreFileCall();
  static GetVectorStoreFileCall getVectorStoreFileCall =
      GetVectorStoreFileCall();
  static DeleteVectorStoreFileCall deleteVectorStoreFileCall =
      DeleteVectorStoreFileCall();
  static CreateVectorStoreFileBatchCall createVectorStoreFileBatchCall =
      CreateVectorStoreFileBatchCall();
  static GetVectorStoreFileBatchCall getVectorStoreFileBatchCall =
      GetVectorStoreFileBatchCall();
  static CancelVectorStoreFileBatchCall cancelVectorStoreFileBatchCall =
      CancelVectorStoreFileBatchCall();
  static ListFilesInVectorStoreBatchCall listFilesInVectorStoreBatchCall =
      ListFilesInVectorStoreBatchCall();
  static CreateBatchCall createBatchCall = CreateBatchCall();
  static ListBatchesCall listBatchesCall = ListBatchesCall();
  static RetrieveBatchCall retrieveBatchCall = RetrieveBatchCall();
  static CancelBatchCall cancelBatchCall = CancelBatchCall();
  static ListInvitesCall listInvitesCall = ListInvitesCall();
  static InviteUserCall inviteUserCall = InviteUserCall();
  static RetrieveInviteCall retrieveInviteCall = RetrieveInviteCall();
  static DeleteInviteCall deleteInviteCall = DeleteInviteCall();
  static ListUsersCall listUsersCall = ListUsersCall();
  static RetrieveUserCall retrieveUserCall = RetrieveUserCall();
  static DeleteUserCall deleteUserCall = DeleteUserCall();
  static ListProjectsCall listProjectsCall = ListProjectsCall();
  static CreateProjectCall createProjectCall = CreateProjectCall();
  static RetrieveProjectCall retrieveProjectCall = RetrieveProjectCall();
  static ArchiveProjectCall archiveProjectCall = ArchiveProjectCall();
  static ListProjectUsersCall listProjectUsersCall = ListProjectUsersCall();
  static CreateProjectUserCall createProjectUserCall = CreateProjectUserCall();
  static RetrieveProjectUserCall retrieveProjectUserCall =
      RetrieveProjectUserCall();
  static DeleteProjectUserCall deleteProjectUserCall = DeleteProjectUserCall();
  static ListProjectServiceAccountsCall listProjectServiceAccountsCall =
      ListProjectServiceAccountsCall();
  static CreateProjectServiceAccountCall createProjectServiceAccountCall =
      CreateProjectServiceAccountCall();
  static RetrieveProjectServiceAccountCall retrieveProjectServiceAccountCall =
      RetrieveProjectServiceAccountCall();
  static DeleteProjectServiceAccountCall deleteProjectServiceAccountCall =
      DeleteProjectServiceAccountCall();
  static ListProjectApiKeysCall listProjectApiKeysCall =
      ListProjectApiKeysCall();
  static RetrieveProjectApiKeyCall retrieveProjectApiKeyCall =
      RetrieveProjectApiKeyCall();
  static DeleteProjectApiKeyCall deleteProjectApiKeyCall =
      DeleteProjectApiKeyCall();
}

class CreateChatCompletionCall {
  Future<ApiCallResponse> call({
    String? messages = '',
    String? apiKey,
  }) async {
    apiKey ??= FFAppConstants.apiKeyOpenAi;
    final baseUrl = OpenAIAPIGroup.getBaseUrl(
      apiKey: apiKey,
    );

    final ffApiRequestBody = '''
{
  "model": "gpt-4o-2024-08-06",
  "messages": [
    {
      "role": "system",
      "content": "Please summarize the lesson in Hebrew, provide detailed feedback on the student's performance, and evaluate progress on a 0-5 scale. - Keep summary concise (60-80 words) minimum 60 words. - Constructive feedback should be strict but supportive, keep your feedback professional. Write the summary in the first person for the student, like a message sent directly to them. - If there are no messages, provide a positive note that the conversation did not take place. Ensure the response is in the specified JSON format, strictly adhering to explicit requirements. # JSON Format The output must be formatted in the following JSON structure: { \\"summary\\": \\"string\\", \\"steps\\": int } - **\\"summary\\"**: A 25-40 word summary of the lesson in Hebrew. - **\\"steps\\"**: An integer score between 0 and 3 indicating the student's progress. - If there are no student messages, set **\\"steps\\"** to 0, and mention that no conversation took place in the summary. # Feedback Requirements - Constructive feedback must evaluate aspects of the student’s work—such as use of grammar, vocabulary, or lesson engagement. - If there is no conversation, simply provide a positive comment that acknowledges participation. # Examples ### Example 1 **Input Summary**: השיעור עסק בחוף הים ונלמדו מילים כמו: fish - דג. **Feedback**: עשית עבודה טובה, אבל כדאי שתשים לב לביטוי השפה בגוף ראשון. **Output**: { \\"summary\\": \\"השיעור עסק בחוף הים ונלמדו מילים כמו: fish - דג\\", \\"steps\\": 2 } ### Example 2 (No Conversation) **Output**: { \\"summary\\": \\"לא התקיימה שיחה בשיעור זה, אך הנכונות שלך לגשת לחומר הלימוד מוערכת מאוד.\\", \\"steps\\": 0 } # Notes - Always validate if the conversation occurred—adjust **steps** and **summary** accordingly. - Make feedback strict, but ensure encouragement is provided where possible."
    },
    {
      "role": "user",
      "content": "the lesson content: ${messages}"
    }
  ],
  "response_format": {
    "type": "json_schema",
    "json_schema": {
      "name": "lesson_summary",
      "strict": true,
      "schema": {
        "type": "object",
        "properties": {
          "summary": {
            "type": "string"
          },
          "steps": {
            "type": "integer"
          }
        },
        "required": [
          "summary",
          "steps"
        ],
        "additionalProperties": false
      }
    }
  }
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'createChatCompletion',
      apiUrl: '${baseUrl}/chat/completions',
      callType: ApiCallType.POST,
      headers: {
        'authorization': 'Bearer ${apiKey}',
        'Content-Type': 'application/json',
        'OpenAI-Beta': 'assistants=v2',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: true,
      decodeUtf8: true,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? summaryobj1(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.choices[:].message.content''',
      ));
}

class CreateStructuredChatCompletionCall {
  Future<ApiCallResponse> call({
    dynamic messagesJson,
    String? apiKey,
  }) async {
    apiKey ??= FFAppConstants.apiKeyOpenAi;
    final baseUrl = OpenAIAPIGroup.getBaseUrl(
      apiKey: apiKey,
    );

    final messages = _serializeJson(messagesJson);
    final ffApiRequestBody = '''
{
  "model": "gpt-4o-mini",
  "messages": [
    {
      "role": "system",
      "content": "AI Teacher Instruction for Hebrew Native Speakers Learning English: Begin with short explanations in Hebrew, gradually introducing English. Focus on conversation and ask the learner to respond. Provide brief, encouraging feedback in Hebrew after each attempt. Slowly decrease Hebrew and increase English over time. Correct mistakes gently by first offering the Hebrew explanation and then the correct English version. Always guide the user to respond, ensuring active practice."
    },
    ${messages}
  ],
  "temperature": 0.7,
  "stream": false
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'createStructuredChatCompletion',
      apiUrl: '${baseUrl}/chat/completions',
      callType: ApiCallType.POST,
      headers: {
        'authorization': 'Bearer ${apiKey}',
        'Content-Type': 'application/json',
        'OpenAI-Beta': 'assistants=v2',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: true,
      decodeUtf8: true,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? aiOutput(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.choices[:].message.content''',
      ));
}

class CreateCompletionCall {
  Future<ApiCallResponse> call({
    String? apiKeyAuth = '',
    String? apiKey,
  }) async {
    apiKey ??= FFAppConstants.apiKeyOpenAi;
    final baseUrl = OpenAIAPIGroup.getBaseUrl(
      apiKey: apiKey,
    );

    final ffApiRequestBody = '''
{
  "model": "",
  "prompt": "",
  "best_of": 0,
  "echo": false,
  "frequency_penalty": 0,
  "logit_bias": {},
  "logprobs": 0,
  "max_tokens": 16,
  "n": 1,
  "presence_penalty": 0,
  "seed": 0,
  "stop": "",
  "stream": false,
  "stream_options": {
    "include_usage": false
  },
  "suffix": "test.",
  "temperature": 1,
  "top_p": 1,
  "user": "user-1234"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'createCompletion',
      apiUrl: '${baseUrl}/completions',
      callType: ApiCallType.POST,
      headers: {
        'authorization': 'Bearer ${apiKey}',
        'Content-Type': 'application/json',
        'OpenAI-Beta': 'assistants=v2',
        'Authorization': 'Bearer ${apiKeyAuth}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class CreateImageCall {
  Future<ApiCallResponse> call({
    String? apiKeyAuth = '',
    String? apiKey,
  }) async {
    apiKey ??= FFAppConstants.apiKeyOpenAi;
    final baseUrl = OpenAIAPIGroup.getBaseUrl(
      apiKey: apiKey,
    );

    final ffApiRequestBody = '''
{
  "prompt": "A cute baby sea otter",
  "model": "dall-e-3",
  "n": 1,
  "quality": "standard",
  "response_format": "url",
  "size": "1024x1024",
  "style": "vivid",
  "user": "user-1234"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'createImage',
      apiUrl: '${baseUrl}/images/generations',
      callType: ApiCallType.POST,
      headers: {
        'authorization': 'Bearer ${apiKey}',
        'Content-Type': 'application/json',
        'OpenAI-Beta': 'assistants=v2',
        'Authorization': 'Bearer ${apiKeyAuth}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class CreateImageEditCall {
  Future<ApiCallResponse> call({
    String? apiKeyAuth = '',
    String? apiKey,
  }) async {
    apiKey ??= FFAppConstants.apiKeyOpenAi;
    final baseUrl = OpenAIAPIGroup.getBaseUrl(
      apiKey: apiKey,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'createImageEdit',
      apiUrl: '${baseUrl}/images/edits',
      callType: ApiCallType.POST,
      headers: {
        'authorization': 'Bearer ${apiKey}',
        'Content-Type': 'application/json',
        'OpenAI-Beta': 'assistants=v2',
        'Authorization': 'Bearer ${apiKeyAuth}',
      },
      params: {},
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class CreateImageVariationCall {
  Future<ApiCallResponse> call({
    String? apiKeyAuth = '',
    String? apiKey,
  }) async {
    apiKey ??= FFAppConstants.apiKeyOpenAi;
    final baseUrl = OpenAIAPIGroup.getBaseUrl(
      apiKey: apiKey,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'createImageVariation',
      apiUrl: '${baseUrl}/images/variations',
      callType: ApiCallType.POST,
      headers: {
        'authorization': 'Bearer ${apiKey}',
        'Content-Type': 'application/json',
        'OpenAI-Beta': 'assistants=v2',
        'Authorization': 'Bearer ${apiKeyAuth}',
      },
      params: {},
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class CreateEmbeddingCall {
  Future<ApiCallResponse> call({
    String? apiKeyAuth = '',
    String? apiKey,
  }) async {
    apiKey ??= FFAppConstants.apiKeyOpenAi;
    final baseUrl = OpenAIAPIGroup.getBaseUrl(
      apiKey: apiKey,
    );

    final ffApiRequestBody = '''
{
  "input": "The quick brown fox jumped over the lazy dog",
  "model": "text-embedding-3-small",
  "encoding_format": "float",
  "dimensions": 0,
  "user": "user-1234"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'createEmbedding',
      apiUrl: '${baseUrl}/embeddings',
      callType: ApiCallType.POST,
      headers: {
        'authorization': 'Bearer ${apiKey}',
        'Content-Type': 'application/json',
        'OpenAI-Beta': 'assistants=v2',
        'Authorization': 'Bearer ${apiKeyAuth}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class CreateSpeechCall {
  Future<ApiCallResponse> call({
    String? model = 'tts-1',
    String? voice = 'alloy',
    String? input = '',
    String? apiKey,
  }) async {
    apiKey ??= FFAppConstants.apiKeyOpenAi;
    final baseUrl = OpenAIAPIGroup.getBaseUrl(
      apiKey: apiKey,
    );

    final ffApiRequestBody = '''
{
  "model": "${model}",
  "input": "${input}",
  "voice": "${voice}",
  "response_format": "mp3"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'createSpeech',
      apiUrl: '${baseUrl}/audio/speech',
      callType: ApiCallType.POST,
      headers: {
        'authorization': 'Bearer ${apiKey}',
        'Content-Type': 'application/json',
        'OpenAI-Beta': 'assistants=v2',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: true,
      decodeUtf8: true,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class CreateTranscriptionCall {
  Future<ApiCallResponse> call({
    String? apiKeyAuth = '',
    FFUploadedFile? file,
    String? audioPath = '',
    String? apiKey,
  }) async {
    apiKey ??= FFAppConstants.apiKeyOpenAi;
    final baseUrl = OpenAIAPIGroup.getBaseUrl(
      apiKey: apiKey,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'createTranscription',
      apiUrl: '${baseUrl}/audio/transcriptions',
      callType: ApiCallType.POST,
      headers: {
        'authorization': 'Bearer ${apiKey}',
        'Content-Type': 'application/json',
        'OpenAI-Beta': 'assistants=v2',
      },
      params: {
        'file': file,
        'model': "whisper-1",
      },
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: true,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class CreateTranslationCall {
  Future<ApiCallResponse> call({
    String? apiKeyAuth = '',
    String? apiKey,
  }) async {
    apiKey ??= FFAppConstants.apiKeyOpenAi;
    final baseUrl = OpenAIAPIGroup.getBaseUrl(
      apiKey: apiKey,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'createTranslation',
      apiUrl: '${baseUrl}/audio/translations',
      callType: ApiCallType.POST,
      headers: {
        'authorization': 'Bearer ${apiKey}',
        'Content-Type': 'application/json',
        'OpenAI-Beta': 'assistants=v2',
        'Authorization': 'Bearer ${apiKeyAuth}',
      },
      params: {},
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ListFilesCall {
  Future<ApiCallResponse> call({
    String? purpose = '',
    String? apiKeyAuth = '',
    String? apiKey,
  }) async {
    apiKey ??= FFAppConstants.apiKeyOpenAi;
    final baseUrl = OpenAIAPIGroup.getBaseUrl(
      apiKey: apiKey,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'listFiles',
      apiUrl: '${baseUrl}/files',
      callType: ApiCallType.GET,
      headers: {
        'authorization': 'Bearer ${apiKey}',
        'Content-Type': 'application/json',
        'OpenAI-Beta': 'assistants=v2',
        'Authorization': 'Bearer ${apiKeyAuth}',
      },
      params: {
        'purpose': purpose,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class CreateFileCall {
  Future<ApiCallResponse> call({
    String? apiKeyAuth = '',
    String? apiKey,
  }) async {
    apiKey ??= FFAppConstants.apiKeyOpenAi;
    final baseUrl = OpenAIAPIGroup.getBaseUrl(
      apiKey: apiKey,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'createFile',
      apiUrl: '${baseUrl}/files',
      callType: ApiCallType.POST,
      headers: {
        'authorization': 'Bearer ${apiKey}',
        'Content-Type': 'application/json',
        'OpenAI-Beta': 'assistants=v2',
        'Authorization': 'Bearer ${apiKeyAuth}',
      },
      params: {},
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class DeleteFileCall {
  Future<ApiCallResponse> call({
    String? fileId = '',
    String? apiKeyAuth = '',
    String? apiKey,
  }) async {
    apiKey ??= FFAppConstants.apiKeyOpenAi;
    final baseUrl = OpenAIAPIGroup.getBaseUrl(
      apiKey: apiKey,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'deleteFile',
      apiUrl: '${baseUrl}/files/${fileId}',
      callType: ApiCallType.DELETE,
      headers: {
        'authorization': 'Bearer ${apiKey}',
        'Content-Type': 'application/json',
        'OpenAI-Beta': 'assistants=v2',
        'Authorization': 'Bearer ${apiKeyAuth}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class RetrieveFileCall {
  Future<ApiCallResponse> call({
    String? fileId = '',
    String? apiKeyAuth = '',
    String? apiKey,
  }) async {
    apiKey ??= FFAppConstants.apiKeyOpenAi;
    final baseUrl = OpenAIAPIGroup.getBaseUrl(
      apiKey: apiKey,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'retrieveFile',
      apiUrl: '${baseUrl}/files/${fileId}',
      callType: ApiCallType.GET,
      headers: {
        'authorization': 'Bearer ${apiKey}',
        'Content-Type': 'application/json',
        'OpenAI-Beta': 'assistants=v2',
        'Authorization': 'Bearer ${apiKeyAuth}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class DownloadFileCall {
  Future<ApiCallResponse> call({
    String? fileId = '',
    String? apiKeyAuth = '',
    String? apiKey,
  }) async {
    apiKey ??= FFAppConstants.apiKeyOpenAi;
    final baseUrl = OpenAIAPIGroup.getBaseUrl(
      apiKey: apiKey,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'downloadFile',
      apiUrl: '${baseUrl}/files/${fileId}/content',
      callType: ApiCallType.GET,
      headers: {
        'authorization': 'Bearer ${apiKey}',
        'Content-Type': 'application/json',
        'OpenAI-Beta': 'assistants=v2',
        'Authorization': 'Bearer ${apiKeyAuth}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class CreateUploadCall {
  Future<ApiCallResponse> call({
    String? apiKeyAuth = '',
    String? apiKey,
  }) async {
    apiKey ??= FFAppConstants.apiKeyOpenAi;
    final baseUrl = OpenAIAPIGroup.getBaseUrl(
      apiKey: apiKey,
    );

    final ffApiRequestBody = '''
{
  "filename": "",
  "purpose": "assistants",
  "bytes": 0,
  "mime_type": ""
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'createUpload',
      apiUrl: '${baseUrl}/uploads',
      callType: ApiCallType.POST,
      headers: {
        'authorization': 'Bearer ${apiKey}',
        'Content-Type': 'application/json',
        'OpenAI-Beta': 'assistants=v2',
        'Authorization': 'Bearer ${apiKeyAuth}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class AddUploadPartCall {
  Future<ApiCallResponse> call({
    String? uploadId = '',
    String? apiKeyAuth = '',
    String? apiKey,
  }) async {
    apiKey ??= FFAppConstants.apiKeyOpenAi;
    final baseUrl = OpenAIAPIGroup.getBaseUrl(
      apiKey: apiKey,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'addUploadPart',
      apiUrl: '${baseUrl}/uploads/${uploadId}/parts',
      callType: ApiCallType.POST,
      headers: {
        'authorization': 'Bearer ${apiKey}',
        'Content-Type': 'application/json',
        'OpenAI-Beta': 'assistants=v2',
        'Authorization': 'Bearer ${apiKeyAuth}',
      },
      params: {},
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class CompleteUploadCall {
  Future<ApiCallResponse> call({
    String? uploadId = '',
    String? apiKeyAuth = '',
    String? apiKey,
  }) async {
    apiKey ??= FFAppConstants.apiKeyOpenAi;
    final baseUrl = OpenAIAPIGroup.getBaseUrl(
      apiKey: apiKey,
    );

    final ffApiRequestBody = '''
{
  "part_ids": [
    ""
  ],
  "md5": ""
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'completeUpload',
      apiUrl: '${baseUrl}/uploads/${uploadId}/complete',
      callType: ApiCallType.POST,
      headers: {
        'authorization': 'Bearer ${apiKey}',
        'Content-Type': 'application/json',
        'OpenAI-Beta': 'assistants=v2',
        'Authorization': 'Bearer ${apiKeyAuth}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class CancelUploadCall {
  Future<ApiCallResponse> call({
    String? uploadId = '',
    String? apiKeyAuth = '',
    String? apiKey,
  }) async {
    apiKey ??= FFAppConstants.apiKeyOpenAi;
    final baseUrl = OpenAIAPIGroup.getBaseUrl(
      apiKey: apiKey,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'cancelUpload',
      apiUrl: '${baseUrl}/uploads/${uploadId}/cancel',
      callType: ApiCallType.POST,
      headers: {
        'authorization': 'Bearer ${apiKey}',
        'Content-Type': 'application/json',
        'OpenAI-Beta': 'assistants=v2',
        'Authorization': 'Bearer ${apiKeyAuth}',
      },
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class CreateFineTuningJobCall {
  Future<ApiCallResponse> call({
    String? apiKeyAuth = '',
    String? apiKey,
  }) async {
    apiKey ??= FFAppConstants.apiKeyOpenAi;
    final baseUrl = OpenAIAPIGroup.getBaseUrl(
      apiKey: apiKey,
    );

    final ffApiRequestBody = '''
{
  "model": "gpt-4o-mini",
  "training_file": "file-abc123",
  "hyperparameters": {
    "batch_size": "",
    "learning_rate_multiplier": "",
    "n_epochs": ""
  },
  "suffix": "",
  "validation_file": "file-abc123",
  "integrations": [
    {
      "type": "",
      "wandb": {
        "project": "my-wandb-project",
        "name": "",
        "entity": "",
        "tags": [
          "custom-tag"
        ]
      }
    }
  ],
  "seed": 42
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'createFineTuningJob',
      apiUrl: '${baseUrl}/fine_tuning/jobs',
      callType: ApiCallType.POST,
      headers: {
        'authorization': 'Bearer ${apiKey}',
        'Content-Type': 'application/json',
        'OpenAI-Beta': 'assistants=v2',
        'Authorization': 'Bearer ${apiKeyAuth}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ListPaginatedFineTuningJobsCall {
  Future<ApiCallResponse> call({
    String? after = '',
    int? limit,
    String? apiKeyAuth = '',
    String? apiKey,
  }) async {
    apiKey ??= FFAppConstants.apiKeyOpenAi;
    final baseUrl = OpenAIAPIGroup.getBaseUrl(
      apiKey: apiKey,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'listPaginatedFineTuningJobs',
      apiUrl: '${baseUrl}/fine_tuning/jobs',
      callType: ApiCallType.GET,
      headers: {
        'authorization': 'Bearer ${apiKey}',
        'Content-Type': 'application/json',
        'OpenAI-Beta': 'assistants=v2',
        'Authorization': 'Bearer ${apiKeyAuth}',
      },
      params: {
        'after': after,
        'limit': limit,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class RetrieveFineTuningJobCall {
  Future<ApiCallResponse> call({
    String? fineTuningJobId = '',
    String? apiKeyAuth = '',
    String? apiKey,
  }) async {
    apiKey ??= FFAppConstants.apiKeyOpenAi;
    final baseUrl = OpenAIAPIGroup.getBaseUrl(
      apiKey: apiKey,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'retrieveFineTuningJob',
      apiUrl: '${baseUrl}/fine_tuning/jobs/${fineTuningJobId}',
      callType: ApiCallType.GET,
      headers: {
        'authorization': 'Bearer ${apiKey}',
        'Content-Type': 'application/json',
        'OpenAI-Beta': 'assistants=v2',
        'Authorization': 'Bearer ${apiKeyAuth}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ListFineTuningEventsCall {
  Future<ApiCallResponse> call({
    String? fineTuningJobId = '',
    String? after = '',
    int? limit,
    String? apiKeyAuth = '',
    String? apiKey,
  }) async {
    apiKey ??= FFAppConstants.apiKeyOpenAi;
    final baseUrl = OpenAIAPIGroup.getBaseUrl(
      apiKey: apiKey,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'listFineTuningEvents',
      apiUrl: '${baseUrl}/fine_tuning/jobs/${fineTuningJobId}/events',
      callType: ApiCallType.GET,
      headers: {
        'authorization': 'Bearer ${apiKey}',
        'Content-Type': 'application/json',
        'OpenAI-Beta': 'assistants=v2',
        'Authorization': 'Bearer ${apiKeyAuth}',
      },
      params: {
        'after': after,
        'limit': limit,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class CancelFineTuningJobCall {
  Future<ApiCallResponse> call({
    String? fineTuningJobId = '',
    String? apiKeyAuth = '',
    String? apiKey,
  }) async {
    apiKey ??= FFAppConstants.apiKeyOpenAi;
    final baseUrl = OpenAIAPIGroup.getBaseUrl(
      apiKey: apiKey,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'cancelFineTuningJob',
      apiUrl: '${baseUrl}/fine_tuning/jobs/${fineTuningJobId}/cancel',
      callType: ApiCallType.POST,
      headers: {
        'authorization': 'Bearer ${apiKey}',
        'Content-Type': 'application/json',
        'OpenAI-Beta': 'assistants=v2',
        'Authorization': 'Bearer ${apiKeyAuth}',
      },
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ListFineTuningJobCheckpointsCall {
  Future<ApiCallResponse> call({
    String? fineTuningJobId = '',
    String? after = '',
    int? limit,
    String? apiKeyAuth = '',
    String? apiKey,
  }) async {
    apiKey ??= FFAppConstants.apiKeyOpenAi;
    final baseUrl = OpenAIAPIGroup.getBaseUrl(
      apiKey: apiKey,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'listFineTuningJobCheckpoints',
      apiUrl: '${baseUrl}/fine_tuning/jobs/${fineTuningJobId}/checkpoints',
      callType: ApiCallType.GET,
      headers: {
        'authorization': 'Bearer ${apiKey}',
        'Content-Type': 'application/json',
        'OpenAI-Beta': 'assistants=v2',
        'Authorization': 'Bearer ${apiKeyAuth}',
      },
      params: {
        'after': after,
        'limit': limit,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ListModelsCall {
  Future<ApiCallResponse> call({
    String? apiKeyAuth = '',
    String? apiKey,
  }) async {
    apiKey ??= FFAppConstants.apiKeyOpenAi;
    final baseUrl = OpenAIAPIGroup.getBaseUrl(
      apiKey: apiKey,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'listModels',
      apiUrl: '${baseUrl}/models',
      callType: ApiCallType.GET,
      headers: {
        'authorization': 'Bearer ${apiKey}',
        'Content-Type': 'application/json',
        'OpenAI-Beta': 'assistants=v2',
        'Authorization': 'Bearer ${apiKeyAuth}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class RetrieveModelCall {
  Future<ApiCallResponse> call({
    String? model = '',
    String? apiKeyAuth = '',
    String? apiKey,
  }) async {
    apiKey ??= FFAppConstants.apiKeyOpenAi;
    final baseUrl = OpenAIAPIGroup.getBaseUrl(
      apiKey: apiKey,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'retrieveModel',
      apiUrl: '${baseUrl}/models/${model}',
      callType: ApiCallType.GET,
      headers: {
        'authorization': 'Bearer ${apiKey}',
        'Content-Type': 'application/json',
        'OpenAI-Beta': 'assistants=v2',
        'Authorization': 'Bearer ${apiKeyAuth}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class DeleteModelCall {
  Future<ApiCallResponse> call({
    String? model = '',
    String? apiKeyAuth = '',
    String? apiKey,
  }) async {
    apiKey ??= FFAppConstants.apiKeyOpenAi;
    final baseUrl = OpenAIAPIGroup.getBaseUrl(
      apiKey: apiKey,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'deleteModel',
      apiUrl: '${baseUrl}/models/${model}',
      callType: ApiCallType.DELETE,
      headers: {
        'authorization': 'Bearer ${apiKey}',
        'Content-Type': 'application/json',
        'OpenAI-Beta': 'assistants=v2',
        'Authorization': 'Bearer ${apiKeyAuth}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class CreateModerationCall {
  Future<ApiCallResponse> call({
    String? apiKeyAuth = '',
    String? apiKey,
  }) async {
    apiKey ??= FFAppConstants.apiKeyOpenAi;
    final baseUrl = OpenAIAPIGroup.getBaseUrl(
      apiKey: apiKey,
    );

    final ffApiRequestBody = '''
{
  "input": "",
  "model": "text-moderation-stable"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'createModeration',
      apiUrl: '${baseUrl}/moderations',
      callType: ApiCallType.POST,
      headers: {
        'authorization': 'Bearer ${apiKey}',
        'Content-Type': 'application/json',
        'OpenAI-Beta': 'assistants=v2',
        'Authorization': 'Bearer ${apiKeyAuth}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ListAssistantsCall {
  Future<ApiCallResponse> call({
    int? limit,
    String? order = '',
    String? after = '',
    String? before = '',
    String? apiKeyAuth = '',
    String? apiKey,
  }) async {
    apiKey ??= FFAppConstants.apiKeyOpenAi;
    final baseUrl = OpenAIAPIGroup.getBaseUrl(
      apiKey: apiKey,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'listAssistants',
      apiUrl: '${baseUrl}/assistants',
      callType: ApiCallType.GET,
      headers: {
        'authorization': 'Bearer ${apiKey}',
        'Content-Type': 'application/json',
        'OpenAI-Beta': 'assistants=v2',
        'Authorization': 'Bearer ${apiKeyAuth}',
      },
      params: {
        'limit': limit,
        'order': order,
        'after': after,
        'before': before,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class CreateAssistantCall {
  Future<ApiCallResponse> call({
    String? apiKeyAuth = '',
    String? apiKey,
  }) async {
    apiKey ??= FFAppConstants.apiKeyOpenAi;
    final baseUrl = OpenAIAPIGroup.getBaseUrl(
      apiKey: apiKey,
    );

    final ffApiRequestBody = '''
{
  "model": "gpt-4o",
  "name": "",
  "description": "",
  "instructions": "",
  "tools": [
    ""
  ],
  "tool_resources": {
    "code_interpreter": {
      "file_ids": [
        ""
      ]
    },
    "file_search": {
      "vector_store_ids": [
        ""
      ],
      "vector_stores": [
        {
          "file_ids": [
            ""
          ],
          "chunking_strategy": {},
          "metadata": {}
        }
      ]
    }
  },
  "metadata": {},
  "temperature": 1,
  "top_p": 1,
  "response_format": ""
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'createAssistant',
      apiUrl: '${baseUrl}/assistants',
      callType: ApiCallType.POST,
      headers: {
        'authorization': 'Bearer ${apiKey}',
        'Content-Type': 'application/json',
        'OpenAI-Beta': 'assistants=v2',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetAssistantCall {
  Future<ApiCallResponse> call({
    String? assistantId = '',
    String? apiKeyAuth = '',
    String? apiKey,
  }) async {
    apiKey ??= FFAppConstants.apiKeyOpenAi;
    final baseUrl = OpenAIAPIGroup.getBaseUrl(
      apiKey: apiKey,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'getAssistant',
      apiUrl: '${baseUrl}/assistants/${assistantId}',
      callType: ApiCallType.GET,
      headers: {
        'authorization': 'Bearer ${apiKey}',
        'Content-Type': 'application/json',
        'OpenAI-Beta': 'assistants=v2',
        'Authorization': 'Bearer ${apiKeyAuth}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ModifyAssistantCall {
  Future<ApiCallResponse> call({
    String? assistantId = '',
    String? apiKeyAuth = '',
    String? apiKey,
  }) async {
    apiKey ??= FFAppConstants.apiKeyOpenAi;
    final baseUrl = OpenAIAPIGroup.getBaseUrl(
      apiKey: apiKey,
    );

    final ffApiRequestBody = '''
{
  "model": "",
  "name": "",
  "description": "",
  "instructions": "",
  "tools": [
    ""
  ],
  "tool_resources": {
    "code_interpreter": {
      "file_ids": [
        ""
      ]
    },
    "file_search": {
      "vector_store_ids": [
        ""
      ]
    }
  },
  "metadata": {},
  "temperature": 1,
  "top_p": 1,
  "response_format": ""
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'modifyAssistant',
      apiUrl: '${baseUrl}/assistants/${assistantId}',
      callType: ApiCallType.POST,
      headers: {
        'authorization': 'Bearer ${apiKey}',
        'Content-Type': 'application/json',
        'OpenAI-Beta': 'assistants=v2',
        'Authorization': 'Bearer ${apiKeyAuth}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class DeleteAssistantCall {
  Future<ApiCallResponse> call({
    String? assistantId = '',
    String? apiKeyAuth = '',
    String? apiKey,
  }) async {
    apiKey ??= FFAppConstants.apiKeyOpenAi;
    final baseUrl = OpenAIAPIGroup.getBaseUrl(
      apiKey: apiKey,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'deleteAssistant',
      apiUrl: '${baseUrl}/assistants/${assistantId}',
      callType: ApiCallType.DELETE,
      headers: {
        'authorization': 'Bearer ${apiKey}',
        'Content-Type': 'application/json',
        'OpenAI-Beta': 'assistants=v2',
        'Authorization': 'Bearer ${apiKeyAuth}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class CreateThreadCall {
  Future<ApiCallResponse> call({
    String? apiKeyAuth = '',
    String? apiKey,
  }) async {
    apiKey ??= FFAppConstants.apiKeyOpenAi;
    final baseUrl = OpenAIAPIGroup.getBaseUrl(
      apiKey: apiKey,
    );

    final ffApiRequestBody = '''
{}''';
    return ApiManager.instance.makeApiCall(
      callName: 'createThread',
      apiUrl: '${baseUrl}/threads',
      callType: ApiCallType.POST,
      headers: {
        'authorization': 'Bearer ${apiKey}',
        'Content-Type': 'application/json',
        'OpenAI-Beta': 'assistants=v2',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? threadId(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.id''',
      ));
}

class GetThreadCall {
  Future<ApiCallResponse> call({
    String? threadId = '',
    String? apiKeyAuth = '',
    String? apiKey,
  }) async {
    apiKey ??= FFAppConstants.apiKeyOpenAi;
    final baseUrl = OpenAIAPIGroup.getBaseUrl(
      apiKey: apiKey,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'getThread',
      apiUrl: '${baseUrl}/threads/${threadId}',
      callType: ApiCallType.GET,
      headers: {
        'authorization': 'Bearer ${apiKey}',
        'Content-Type': 'application/json',
        'OpenAI-Beta': 'assistants=v2',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ModifyThreadCall {
  Future<ApiCallResponse> call({
    String? threadId = '',
    String? apiKeyAuth = '',
    String? apiKey,
  }) async {
    apiKey ??= FFAppConstants.apiKeyOpenAi;
    final baseUrl = OpenAIAPIGroup.getBaseUrl(
      apiKey: apiKey,
    );

    final ffApiRequestBody = '''
{
  "tool_resources": {
    "code_interpreter": {
      "file_ids": [
        ""
      ]
    },
    "file_search": {
      "vector_store_ids": [
        ""
      ]
    }
  },
  "metadata": {}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'modifyThread',
      apiUrl: '${baseUrl}/threads/${threadId}',
      callType: ApiCallType.POST,
      headers: {
        'authorization': 'Bearer ${apiKey}',
        'Content-Type': 'application/json',
        'OpenAI-Beta': 'assistants=v2',
        'Authorization': 'Bearer ${apiKeyAuth}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class DeleteThreadCall {
  Future<ApiCallResponse> call({
    String? threadId = '',
    String? apiKeyAuth = '',
    String? apiKey,
  }) async {
    apiKey ??= FFAppConstants.apiKeyOpenAi;
    final baseUrl = OpenAIAPIGroup.getBaseUrl(
      apiKey: apiKey,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'deleteThread',
      apiUrl: '${baseUrl}/threads/${threadId}',
      callType: ApiCallType.DELETE,
      headers: {
        'authorization': 'Bearer ${apiKey}',
        'Content-Type': 'application/json',
        'OpenAI-Beta': 'assistants=v2',
        'Authorization': 'Bearer ${apiKeyAuth}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ListMessagesCall {
  Future<ApiCallResponse> call({
    String? threadId = '',
    int? limit,
    String? order = '',
    String? after = '',
    String? before = '',
    String? runId = '',
    String? apiKeyAuth = '',
    String? apiKey,
  }) async {
    apiKey ??= FFAppConstants.apiKeyOpenAi;
    final baseUrl = OpenAIAPIGroup.getBaseUrl(
      apiKey: apiKey,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'listMessages',
      apiUrl: '${baseUrl}/threads/${threadId}/messages',
      callType: ApiCallType.GET,
      headers: {
        'authorization': 'Bearer ${apiKey}',
        'Content-Type': 'application/json',
        'OpenAI-Beta': 'assistants=v2',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: true,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? data(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data[0].content[0].text.value''',
      ));
}

class CreateMessageCall {
  Future<ApiCallResponse> call({
    String? threadId = '',
    String? messageContent = '',
    String? apiKey,
  }) async {
    apiKey ??= FFAppConstants.apiKeyOpenAi;
    final baseUrl = OpenAIAPIGroup.getBaseUrl(
      apiKey: apiKey,
    );

    final ffApiRequestBody = '''
{
  "role": "user",
  "content": "${messageContent}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'createMessage',
      apiUrl: '${baseUrl}/threads/${threadId}/messages',
      callType: ApiCallType.POST,
      headers: {
        'authorization': 'Bearer ${apiKey}',
        'Content-Type': 'application/json',
        'OpenAI-Beta': 'assistants=v2',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: true,
      decodeUtf8: true,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetMessageCall {
  Future<ApiCallResponse> call({
    String? threadId = '',
    String? messageId = '',
    String? apiKeyAuth = '',
    String? apiKey,
  }) async {
    apiKey ??= FFAppConstants.apiKeyOpenAi;
    final baseUrl = OpenAIAPIGroup.getBaseUrl(
      apiKey: apiKey,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'getMessage',
      apiUrl: '${baseUrl}/threads/${threadId}/messages/${messageId}',
      callType: ApiCallType.GET,
      headers: {
        'authorization': 'Bearer ${apiKey}',
        'Content-Type': 'application/json',
        'OpenAI-Beta': 'assistants=v2',
        'Authorization': 'Bearer ${apiKeyAuth}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ModifyMessageCall {
  Future<ApiCallResponse> call({
    String? threadId = '',
    String? messageId = '',
    String? apiKeyAuth = '',
    String? apiKey,
  }) async {
    apiKey ??= FFAppConstants.apiKeyOpenAi;
    final baseUrl = OpenAIAPIGroup.getBaseUrl(
      apiKey: apiKey,
    );

    final ffApiRequestBody = '''
{
  "metadata": {}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'modifyMessage',
      apiUrl: '${baseUrl}/threads/${threadId}/messages/${messageId}',
      callType: ApiCallType.POST,
      headers: {
        'authorization': 'Bearer ${apiKey}',
        'Content-Type': 'application/json',
        'OpenAI-Beta': 'assistants=v2',
        'Authorization': 'Bearer ${apiKeyAuth}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class DeleteMessageCall {
  Future<ApiCallResponse> call({
    String? threadId = '',
    String? messageId = '',
    String? apiKeyAuth = '',
    String? apiKey,
  }) async {
    apiKey ??= FFAppConstants.apiKeyOpenAi;
    final baseUrl = OpenAIAPIGroup.getBaseUrl(
      apiKey: apiKey,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'deleteMessage',
      apiUrl: '${baseUrl}/threads/${threadId}/messages/${messageId}',
      callType: ApiCallType.DELETE,
      headers: {
        'authorization': 'Bearer ${apiKey}',
        'Content-Type': 'application/json',
        'OpenAI-Beta': 'assistants=v2',
        'Authorization': 'Bearer ${apiKeyAuth}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class CreateThreadAndRunCall {
  Future<ApiCallResponse> call({
    dynamic messagesJson,
    String? assistantId = '',
    String? apiKey,
  }) async {
    apiKey ??= FFAppConstants.apiKeyOpenAi;
    final baseUrl = OpenAIAPIGroup.getBaseUrl(
      apiKey: apiKey,
    );

    final messages = _serializeJson(messagesJson);
    final ffApiRequestBody = '''
{
  "assistant_id": "${assistantId}",
  "thread": {
    "messages": [
      ${messages}
    ]
  }
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'createThreadAndRun',
      apiUrl: '${baseUrl}/threads/runs',
      callType: ApiCallType.POST,
      headers: {
        'authorization': 'Bearer ${apiKey}',
        'Content-Type': 'application/json',
        'OpenAI-Beta': 'assistants=v2',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? threadId(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.thread_id''',
      ));
  String? threadStatus(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.status''',
      ));
  String? runId(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.id''',
      ));
}

class ListRunsCall {
  Future<ApiCallResponse> call({
    String? threadId = '',
    int? limit,
    String? order = '',
    String? after = '',
    String? before = '',
    String? apiKeyAuth = '',
    String? apiKey,
  }) async {
    apiKey ??= FFAppConstants.apiKeyOpenAi;
    final baseUrl = OpenAIAPIGroup.getBaseUrl(
      apiKey: apiKey,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'listRuns',
      apiUrl: '${baseUrl}/threads/${threadId}/runs',
      callType: ApiCallType.GET,
      headers: {
        'authorization': 'Bearer ${apiKey}',
        'Content-Type': 'application/json',
        'OpenAI-Beta': 'assistants=v2',
      },
      params: {
        'limit': limit,
        'order': order,
        'after': after,
        'before': before,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class CreateRunCall {
  Future<ApiCallResponse> call({
    String? threadId = '',
    String? assistantId = 'asst_7Z7QNYwZ8iQFbf78Cu9dMO7J',
    String? additionalInstructions = '',
    String? apiKey,
  }) async {
    apiKey ??= FFAppConstants.apiKeyOpenAi;
    final baseUrl = OpenAIAPIGroup.getBaseUrl(
      apiKey: apiKey,
    );

    final ffApiRequestBody = '''
{
  "assistant_id": "${assistantId}",
  "additional_instructions": "${additionalInstructions}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'createRun',
      apiUrl: '${baseUrl}/threads/${threadId}/runs',
      callType: ApiCallType.POST,
      headers: {
        'authorization': 'Bearer ${apiKey}',
        'Content-Type': 'application/json',
        'OpenAI-Beta': 'assistants=v2',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: true,
      decodeUtf8: true,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? runId(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.id''',
      ));
  String? status(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.status''',
      ));
}

class GetRunCall {
  Future<ApiCallResponse> call({
    String? threadId = '',
    String? runId = '',
    String? apiKeyAuth = '',
    String? apiKey,
  }) async {
    apiKey ??= FFAppConstants.apiKeyOpenAi;
    final baseUrl = OpenAIAPIGroup.getBaseUrl(
      apiKey: apiKey,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'getRun',
      apiUrl: '${baseUrl}/threads/${threadId}/runs/${runId}',
      callType: ApiCallType.GET,
      headers: {
        'authorization': 'Bearer ${apiKey}',
        'Content-Type': 'application/json',
        'OpenAI-Beta': 'assistants=v2',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: true,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? runStatus(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.status''',
      ));
}

class ModifyRunCall {
  Future<ApiCallResponse> call({
    String? threadId = '',
    String? runId = '',
    String? apiKeyAuth = '',
    String? apiKey,
  }) async {
    apiKey ??= FFAppConstants.apiKeyOpenAi;
    final baseUrl = OpenAIAPIGroup.getBaseUrl(
      apiKey: apiKey,
    );

    final ffApiRequestBody = '''
{
  "metadata": {}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'modifyRun',
      apiUrl: '${baseUrl}/threads/${threadId}/runs/${runId}',
      callType: ApiCallType.POST,
      headers: {
        'authorization': 'Bearer ${apiKey}',
        'Content-Type': 'application/json',
        'OpenAI-Beta': 'assistants=v2',
        'Authorization': 'Bearer ${apiKeyAuth}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class SubmitToolOuputsToRunCall {
  Future<ApiCallResponse> call({
    String? threadId = '',
    String? runId = '',
    String? apiKeyAuth = '',
    String? apiKey,
  }) async {
    apiKey ??= FFAppConstants.apiKeyOpenAi;
    final baseUrl = OpenAIAPIGroup.getBaseUrl(
      apiKey: apiKey,
    );

    final ffApiRequestBody = '''
{
  "tool_outputs": [
    {
      "tool_call_id": "",
      "output": ""
    }
  ],
  "stream": false
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'submitToolOuputsToRun',
      apiUrl:
          '${baseUrl}/threads/${threadId}/runs/${runId}/submit_tool_outputs',
      callType: ApiCallType.POST,
      headers: {
        'authorization': 'Bearer ${apiKey}',
        'Content-Type': 'application/json',
        'OpenAI-Beta': 'assistants=v2',
        'Authorization': 'Bearer ${apiKeyAuth}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class CancelRunCall {
  Future<ApiCallResponse> call({
    String? threadId = '',
    String? runId = '',
    String? apiKeyAuth = '',
    String? apiKey,
  }) async {
    apiKey ??= FFAppConstants.apiKeyOpenAi;
    final baseUrl = OpenAIAPIGroup.getBaseUrl(
      apiKey: apiKey,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'cancelRun',
      apiUrl: '${baseUrl}/threads/${threadId}/runs/${runId}/cancel',
      callType: ApiCallType.POST,
      headers: {
        'authorization': 'Bearer ${apiKey}',
        'Content-Type': 'application/json',
        'OpenAI-Beta': 'assistants=v2',
        'Authorization': 'Bearer ${apiKeyAuth}',
      },
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ListRunStepsCall {
  Future<ApiCallResponse> call({
    String? threadId = '',
    String? runId = '',
    int? limit,
    String? order = '',
    String? after = '',
    String? before = '',
    String? apiKeyAuth = '',
    String? apiKey,
  }) async {
    apiKey ??= FFAppConstants.apiKeyOpenAi;
    final baseUrl = OpenAIAPIGroup.getBaseUrl(
      apiKey: apiKey,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'listRunSteps',
      apiUrl: '${baseUrl}/threads/${threadId}/runs/${runId}/steps',
      callType: ApiCallType.GET,
      headers: {
        'authorization': 'Bearer ${apiKey}',
        'Content-Type': 'application/json',
        'OpenAI-Beta': 'assistants=v2',
        'Authorization': 'Bearer ${apiKeyAuth}',
      },
      params: {
        'limit': limit,
        'order': order,
        'after': after,
        'before': before,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetRunStepCall {
  Future<ApiCallResponse> call({
    String? threadId = '',
    String? runId = '',
    String? stepId = '',
    String? apiKeyAuth = '',
    String? apiKey,
  }) async {
    apiKey ??= FFAppConstants.apiKeyOpenAi;
    final baseUrl = OpenAIAPIGroup.getBaseUrl(
      apiKey: apiKey,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'getRunStep',
      apiUrl: '${baseUrl}/threads/${threadId}/runs/${runId}/steps/${stepId}',
      callType: ApiCallType.GET,
      headers: {
        'authorization': 'Bearer ${apiKey}',
        'Content-Type': 'application/json',
        'OpenAI-Beta': 'assistants=v2',
        'Authorization': 'Bearer ${apiKeyAuth}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ListVectorStoresCall {
  Future<ApiCallResponse> call({
    int? limit,
    String? order = '',
    String? after = '',
    String? before = '',
    String? apiKeyAuth = '',
    String? apiKey,
  }) async {
    apiKey ??= FFAppConstants.apiKeyOpenAi;
    final baseUrl = OpenAIAPIGroup.getBaseUrl(
      apiKey: apiKey,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'listVectorStores',
      apiUrl: '${baseUrl}/vector_stores',
      callType: ApiCallType.GET,
      headers: {
        'authorization': 'Bearer ${apiKey}',
        'Content-Type': 'application/json',
        'OpenAI-Beta': 'assistants=v2',
        'Authorization': 'Bearer ${apiKeyAuth}',
      },
      params: {
        'limit': limit,
        'order': order,
        'after': after,
        'before': before,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class CreateVectorStoreCall {
  Future<ApiCallResponse> call({
    String? apiKeyAuth = '',
    String? apiKey,
  }) async {
    apiKey ??= FFAppConstants.apiKeyOpenAi;
    final baseUrl = OpenAIAPIGroup.getBaseUrl(
      apiKey: apiKey,
    );

    final ffApiRequestBody = '''
{
  "file_ids": [
    ""
  ],
  "name": "",
  "expires_after": {
    "anchor": "last_active_at",
    "days": 0
  },
  "chunking_strategy": {},
  "metadata": {}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'createVectorStore',
      apiUrl: '${baseUrl}/vector_stores',
      callType: ApiCallType.POST,
      headers: {
        'authorization': 'Bearer ${apiKey}',
        'Content-Type': 'application/json',
        'OpenAI-Beta': 'assistants=v2',
        'Authorization': 'Bearer ${apiKeyAuth}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetVectorStoreCall {
  Future<ApiCallResponse> call({
    String? vectorStoreId = '',
    String? apiKeyAuth = '',
    String? apiKey,
  }) async {
    apiKey ??= FFAppConstants.apiKeyOpenAi;
    final baseUrl = OpenAIAPIGroup.getBaseUrl(
      apiKey: apiKey,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'getVectorStore',
      apiUrl: '${baseUrl}/vector_stores/${vectorStoreId}',
      callType: ApiCallType.GET,
      headers: {
        'authorization': 'Bearer ${apiKey}',
        'Content-Type': 'application/json',
        'OpenAI-Beta': 'assistants=v2',
        'Authorization': 'Bearer ${apiKeyAuth}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ModifyVectorStoreCall {
  Future<ApiCallResponse> call({
    String? vectorStoreId = '',
    String? apiKeyAuth = '',
    String? apiKey,
  }) async {
    apiKey ??= FFAppConstants.apiKeyOpenAi;
    final baseUrl = OpenAIAPIGroup.getBaseUrl(
      apiKey: apiKey,
    );

    final ffApiRequestBody = '''
{
  "name": "",
  "expires_after": {
    "anchor": "last_active_at",
    "days": 0
  },
  "metadata": {}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'modifyVectorStore',
      apiUrl: '${baseUrl}/vector_stores/${vectorStoreId}',
      callType: ApiCallType.POST,
      headers: {
        'authorization': 'Bearer ${apiKey}',
        'Content-Type': 'application/json',
        'OpenAI-Beta': 'assistants=v2',
        'Authorization': 'Bearer ${apiKeyAuth}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class DeleteVectorStoreCall {
  Future<ApiCallResponse> call({
    String? vectorStoreId = '',
    String? apiKeyAuth = '',
    String? apiKey,
  }) async {
    apiKey ??= FFAppConstants.apiKeyOpenAi;
    final baseUrl = OpenAIAPIGroup.getBaseUrl(
      apiKey: apiKey,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'deleteVectorStore',
      apiUrl: '${baseUrl}/vector_stores/${vectorStoreId}',
      callType: ApiCallType.DELETE,
      headers: {
        'authorization': 'Bearer ${apiKey}',
        'Content-Type': 'application/json',
        'OpenAI-Beta': 'assistants=v2',
        'Authorization': 'Bearer ${apiKeyAuth}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ListVectorStoreFilesCall {
  Future<ApiCallResponse> call({
    String? vectorStoreId = '',
    int? limit,
    String? order = '',
    String? after = '',
    String? before = '',
    String? filter = '',
    String? apiKeyAuth = '',
    String? apiKey,
  }) async {
    apiKey ??= FFAppConstants.apiKeyOpenAi;
    final baseUrl = OpenAIAPIGroup.getBaseUrl(
      apiKey: apiKey,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'listVectorStoreFiles',
      apiUrl: '${baseUrl}/vector_stores/${vectorStoreId}/files',
      callType: ApiCallType.GET,
      headers: {
        'authorization': 'Bearer ${apiKey}',
        'Content-Type': 'application/json',
        'OpenAI-Beta': 'assistants=v2',
        'Authorization': 'Bearer ${apiKeyAuth}',
      },
      params: {
        'limit': limit,
        'order': order,
        'after': after,
        'before': before,
        'filter': filter,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class CreateVectorStoreFileCall {
  Future<ApiCallResponse> call({
    String? vectorStoreId = '',
    String? apiKeyAuth = '',
    String? apiKey,
  }) async {
    apiKey ??= FFAppConstants.apiKeyOpenAi;
    final baseUrl = OpenAIAPIGroup.getBaseUrl(
      apiKey: apiKey,
    );

    final ffApiRequestBody = '''
{
  "file_id": "",
  "chunking_strategy": {}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'createVectorStoreFile',
      apiUrl: '${baseUrl}/vector_stores/${vectorStoreId}/files',
      callType: ApiCallType.POST,
      headers: {
        'authorization': 'Bearer ${apiKey}',
        'Content-Type': 'application/json',
        'OpenAI-Beta': 'assistants=v2',
        'Authorization': 'Bearer ${apiKeyAuth}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetVectorStoreFileCall {
  Future<ApiCallResponse> call({
    String? vectorStoreId = '',
    String? fileId = '',
    String? apiKeyAuth = '',
    String? apiKey,
  }) async {
    apiKey ??= FFAppConstants.apiKeyOpenAi;
    final baseUrl = OpenAIAPIGroup.getBaseUrl(
      apiKey: apiKey,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'getVectorStoreFile',
      apiUrl: '${baseUrl}/vector_stores/${vectorStoreId}/files/${fileId}',
      callType: ApiCallType.GET,
      headers: {
        'authorization': 'Bearer ${apiKey}',
        'Content-Type': 'application/json',
        'OpenAI-Beta': 'assistants=v2',
        'Authorization': 'Bearer ${apiKeyAuth}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class DeleteVectorStoreFileCall {
  Future<ApiCallResponse> call({
    String? vectorStoreId = '',
    String? fileId = '',
    String? apiKeyAuth = '',
    String? apiKey,
  }) async {
    apiKey ??= FFAppConstants.apiKeyOpenAi;
    final baseUrl = OpenAIAPIGroup.getBaseUrl(
      apiKey: apiKey,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'deleteVectorStoreFile',
      apiUrl: '${baseUrl}/vector_stores/${vectorStoreId}/files/${fileId}',
      callType: ApiCallType.DELETE,
      headers: {
        'authorization': 'Bearer ${apiKey}',
        'Content-Type': 'application/json',
        'OpenAI-Beta': 'assistants=v2',
        'Authorization': 'Bearer ${apiKeyAuth}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class CreateVectorStoreFileBatchCall {
  Future<ApiCallResponse> call({
    String? vectorStoreId = '',
    String? apiKeyAuth = '',
    String? apiKey,
  }) async {
    apiKey ??= FFAppConstants.apiKeyOpenAi;
    final baseUrl = OpenAIAPIGroup.getBaseUrl(
      apiKey: apiKey,
    );

    final ffApiRequestBody = '''
{
  "file_ids": [
    ""
  ],
  "chunking_strategy": {}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'createVectorStoreFileBatch',
      apiUrl: '${baseUrl}/vector_stores/${vectorStoreId}/file_batches',
      callType: ApiCallType.POST,
      headers: {
        'authorization': 'Bearer ${apiKey}',
        'Content-Type': 'application/json',
        'OpenAI-Beta': 'assistants=v2',
        'Authorization': 'Bearer ${apiKeyAuth}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetVectorStoreFileBatchCall {
  Future<ApiCallResponse> call({
    String? vectorStoreId = '',
    String? batchId = '',
    String? apiKeyAuth = '',
    String? apiKey,
  }) async {
    apiKey ??= FFAppConstants.apiKeyOpenAi;
    final baseUrl = OpenAIAPIGroup.getBaseUrl(
      apiKey: apiKey,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'getVectorStoreFileBatch',
      apiUrl:
          '${baseUrl}/vector_stores/${vectorStoreId}/file_batches/${batchId}',
      callType: ApiCallType.GET,
      headers: {
        'authorization': 'Bearer ${apiKey}',
        'Content-Type': 'application/json',
        'OpenAI-Beta': 'assistants=v2',
        'Authorization': 'Bearer ${apiKeyAuth}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class CancelVectorStoreFileBatchCall {
  Future<ApiCallResponse> call({
    String? vectorStoreId = '',
    String? batchId = '',
    String? apiKeyAuth = '',
    String? apiKey,
  }) async {
    apiKey ??= FFAppConstants.apiKeyOpenAi;
    final baseUrl = OpenAIAPIGroup.getBaseUrl(
      apiKey: apiKey,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'cancelVectorStoreFileBatch',
      apiUrl:
          '${baseUrl}/vector_stores/${vectorStoreId}/file_batches/${batchId}/cancel',
      callType: ApiCallType.POST,
      headers: {
        'authorization': 'Bearer ${apiKey}',
        'Content-Type': 'application/json',
        'OpenAI-Beta': 'assistants=v2',
        'Authorization': 'Bearer ${apiKeyAuth}',
      },
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ListFilesInVectorStoreBatchCall {
  Future<ApiCallResponse> call({
    String? vectorStoreId = '',
    String? batchId = '',
    int? limit,
    String? order = '',
    String? after = '',
    String? before = '',
    String? filter = '',
    String? apiKeyAuth = '',
    String? apiKey,
  }) async {
    apiKey ??= FFAppConstants.apiKeyOpenAi;
    final baseUrl = OpenAIAPIGroup.getBaseUrl(
      apiKey: apiKey,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'listFilesInVectorStoreBatch',
      apiUrl:
          '${baseUrl}/vector_stores/${vectorStoreId}/file_batches/${batchId}/files',
      callType: ApiCallType.GET,
      headers: {
        'authorization': 'Bearer ${apiKey}',
        'Content-Type': 'application/json',
        'OpenAI-Beta': 'assistants=v2',
        'Authorization': 'Bearer ${apiKeyAuth}',
      },
      params: {
        'limit': limit,
        'order': order,
        'after': after,
        'before': before,
        'filter': filter,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class CreateBatchCall {
  Future<ApiCallResponse> call({
    String? apiKeyAuth = '',
    String? apiKey,
  }) async {
    apiKey ??= FFAppConstants.apiKeyOpenAi;
    final baseUrl = OpenAIAPIGroup.getBaseUrl(
      apiKey: apiKey,
    );

    final ffApiRequestBody = '''
{
  "input_file_id": "",
  "endpoint": "/v1/chat/completions",
  "completion_window": "24h",
  "metadata": {}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'createBatch',
      apiUrl: '${baseUrl}/batches',
      callType: ApiCallType.POST,
      headers: {
        'authorization': 'Bearer ${apiKey}',
        'Content-Type': 'application/json',
        'OpenAI-Beta': 'assistants=v2',
        'Authorization': 'Bearer ${apiKeyAuth}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ListBatchesCall {
  Future<ApiCallResponse> call({
    String? after = '',
    int? limit,
    String? apiKeyAuth = '',
    String? apiKey,
  }) async {
    apiKey ??= FFAppConstants.apiKeyOpenAi;
    final baseUrl = OpenAIAPIGroup.getBaseUrl(
      apiKey: apiKey,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'listBatches',
      apiUrl: '${baseUrl}/batches',
      callType: ApiCallType.GET,
      headers: {
        'authorization': 'Bearer ${apiKey}',
        'Content-Type': 'application/json',
        'OpenAI-Beta': 'assistants=v2',
        'Authorization': 'Bearer ${apiKeyAuth}',
      },
      params: {
        'after': after,
        'limit': limit,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class RetrieveBatchCall {
  Future<ApiCallResponse> call({
    String? batchId = '',
    String? apiKeyAuth = '',
    String? apiKey,
  }) async {
    apiKey ??= FFAppConstants.apiKeyOpenAi;
    final baseUrl = OpenAIAPIGroup.getBaseUrl(
      apiKey: apiKey,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'retrieveBatch',
      apiUrl: '${baseUrl}/batches/${batchId}',
      callType: ApiCallType.GET,
      headers: {
        'authorization': 'Bearer ${apiKey}',
        'Content-Type': 'application/json',
        'OpenAI-Beta': 'assistants=v2',
        'Authorization': 'Bearer ${apiKeyAuth}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class CancelBatchCall {
  Future<ApiCallResponse> call({
    String? batchId = '',
    String? apiKeyAuth = '',
    String? apiKey,
  }) async {
    apiKey ??= FFAppConstants.apiKeyOpenAi;
    final baseUrl = OpenAIAPIGroup.getBaseUrl(
      apiKey: apiKey,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'cancelBatch',
      apiUrl: '${baseUrl}/batches/${batchId}/cancel',
      callType: ApiCallType.POST,
      headers: {
        'authorization': 'Bearer ${apiKey}',
        'Content-Type': 'application/json',
        'OpenAI-Beta': 'assistants=v2',
        'Authorization': 'Bearer ${apiKeyAuth}',
      },
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ListInvitesCall {
  Future<ApiCallResponse> call({
    int? limit,
    String? after = '',
    String? apiKeyAuth = '',
    String? apiKey,
  }) async {
    apiKey ??= FFAppConstants.apiKeyOpenAi;
    final baseUrl = OpenAIAPIGroup.getBaseUrl(
      apiKey: apiKey,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'list-invites',
      apiUrl: '${baseUrl}/organization/invites',
      callType: ApiCallType.GET,
      headers: {
        'authorization': 'Bearer ${apiKey}',
        'Content-Type': 'application/json',
        'OpenAI-Beta': 'assistants=v2',
        'Authorization': 'Bearer ${apiKeyAuth}',
      },
      params: {
        'limit': limit,
        'after': after,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class InviteUserCall {
  Future<ApiCallResponse> call({
    String? apiKeyAuth = '',
    String? apiKey,
  }) async {
    apiKey ??= FFAppConstants.apiKeyOpenAi;
    final baseUrl = OpenAIAPIGroup.getBaseUrl(
      apiKey: apiKey,
    );

    final ffApiRequestBody = '''
{
  "email": "",
  "role": "reader"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'inviteUser',
      apiUrl: '${baseUrl}/organization/invites',
      callType: ApiCallType.POST,
      headers: {
        'authorization': 'Bearer ${apiKey}',
        'Content-Type': 'application/json',
        'OpenAI-Beta': 'assistants=v2',
        'Authorization': 'Bearer ${apiKeyAuth}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class RetrieveInviteCall {
  Future<ApiCallResponse> call({
    String? inviteId = '',
    String? apiKeyAuth = '',
    String? apiKey,
  }) async {
    apiKey ??= FFAppConstants.apiKeyOpenAi;
    final baseUrl = OpenAIAPIGroup.getBaseUrl(
      apiKey: apiKey,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'retrieve-invite',
      apiUrl: '${baseUrl}/organization/invites/${inviteId}',
      callType: ApiCallType.GET,
      headers: {
        'authorization': 'Bearer ${apiKey}',
        'Content-Type': 'application/json',
        'OpenAI-Beta': 'assistants=v2',
        'Authorization': 'Bearer ${apiKeyAuth}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class DeleteInviteCall {
  Future<ApiCallResponse> call({
    String? inviteId = '',
    String? apiKeyAuth = '',
    String? apiKey,
  }) async {
    apiKey ??= FFAppConstants.apiKeyOpenAi;
    final baseUrl = OpenAIAPIGroup.getBaseUrl(
      apiKey: apiKey,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'delete-invite',
      apiUrl: '${baseUrl}/organization/invites/${inviteId}',
      callType: ApiCallType.DELETE,
      headers: {
        'authorization': 'Bearer ${apiKey}',
        'Content-Type': 'application/json',
        'OpenAI-Beta': 'assistants=v2',
        'Authorization': 'Bearer ${apiKeyAuth}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ListUsersCall {
  Future<ApiCallResponse> call({
    int? limit,
    String? after = '',
    String? apiKeyAuth = '',
    String? apiKey,
  }) async {
    apiKey ??= FFAppConstants.apiKeyOpenAi;
    final baseUrl = OpenAIAPIGroup.getBaseUrl(
      apiKey: apiKey,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'list-users',
      apiUrl: '${baseUrl}/organization/users',
      callType: ApiCallType.GET,
      headers: {
        'authorization': 'Bearer ${apiKey}',
        'Content-Type': 'application/json',
        'OpenAI-Beta': 'assistants=v2',
        'Authorization': 'Bearer ${apiKeyAuth}',
      },
      params: {
        'limit': limit,
        'after': after,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class RetrieveUserCall {
  Future<ApiCallResponse> call({
    String? userId = '',
    String? apiKeyAuth = '',
    String? apiKey,
  }) async {
    apiKey ??= FFAppConstants.apiKeyOpenAi;
    final baseUrl = OpenAIAPIGroup.getBaseUrl(
      apiKey: apiKey,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'retrieve-user',
      apiUrl: '${baseUrl}/organization/users/${userId}',
      callType: ApiCallType.GET,
      headers: {
        'authorization': 'Bearer ${apiKey}',
        'Content-Type': 'application/json',
        'OpenAI-Beta': 'assistants=v2',
        'Authorization': 'Bearer ${apiKeyAuth}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class DeleteUserCall {
  Future<ApiCallResponse> call({
    String? userId = '',
    String? apiKeyAuth = '',
    String? apiKey,
  }) async {
    apiKey ??= FFAppConstants.apiKeyOpenAi;
    final baseUrl = OpenAIAPIGroup.getBaseUrl(
      apiKey: apiKey,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'delete-user',
      apiUrl: '${baseUrl}/organization/users/${userId}',
      callType: ApiCallType.DELETE,
      headers: {
        'authorization': 'Bearer ${apiKey}',
        'Content-Type': 'application/json',
        'OpenAI-Beta': 'assistants=v2',
        'Authorization': 'Bearer ${apiKeyAuth}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ListProjectsCall {
  Future<ApiCallResponse> call({
    int? limit,
    String? after = '',
    bool? includeArchived,
    String? apiKeyAuth = '',
    String? apiKey,
  }) async {
    apiKey ??= FFAppConstants.apiKeyOpenAi;
    final baseUrl = OpenAIAPIGroup.getBaseUrl(
      apiKey: apiKey,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'list-projects',
      apiUrl: '${baseUrl}/organization/projects',
      callType: ApiCallType.GET,
      headers: {
        'authorization': 'Bearer ${apiKey}',
        'Content-Type': 'application/json',
        'OpenAI-Beta': 'assistants=v2',
        'Authorization': 'Bearer ${apiKeyAuth}',
      },
      params: {
        'limit': limit,
        'after': after,
        'include_archived': includeArchived,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class CreateProjectCall {
  Future<ApiCallResponse> call({
    String? apiKeyAuth = '',
    String? apiKey,
  }) async {
    apiKey ??= FFAppConstants.apiKeyOpenAi;
    final baseUrl = OpenAIAPIGroup.getBaseUrl(
      apiKey: apiKey,
    );

    final ffApiRequestBody = '''
{
  "name": ""
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'create-project',
      apiUrl: '${baseUrl}/organization/projects',
      callType: ApiCallType.POST,
      headers: {
        'authorization': 'Bearer ${apiKey}',
        'Content-Type': 'application/json',
        'OpenAI-Beta': 'assistants=v2',
        'Authorization': 'Bearer ${apiKeyAuth}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class RetrieveProjectCall {
  Future<ApiCallResponse> call({
    String? projectId = '',
    String? apiKeyAuth = '',
    String? apiKey,
  }) async {
    apiKey ??= FFAppConstants.apiKeyOpenAi;
    final baseUrl = OpenAIAPIGroup.getBaseUrl(
      apiKey: apiKey,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'retrieve-project',
      apiUrl: '${baseUrl}/organization/projects/${projectId}',
      callType: ApiCallType.GET,
      headers: {
        'authorization': 'Bearer ${apiKey}',
        'Content-Type': 'application/json',
        'OpenAI-Beta': 'assistants=v2',
        'Authorization': 'Bearer ${apiKeyAuth}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ArchiveProjectCall {
  Future<ApiCallResponse> call({
    String? projectId = '',
    String? apiKeyAuth = '',
    String? apiKey,
  }) async {
    apiKey ??= FFAppConstants.apiKeyOpenAi;
    final baseUrl = OpenAIAPIGroup.getBaseUrl(
      apiKey: apiKey,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'archive-project',
      apiUrl: '${baseUrl}/organization/projects/${projectId}/archive',
      callType: ApiCallType.POST,
      headers: {
        'authorization': 'Bearer ${apiKey}',
        'Content-Type': 'application/json',
        'OpenAI-Beta': 'assistants=v2',
        'Authorization': 'Bearer ${apiKeyAuth}',
      },
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ListProjectUsersCall {
  Future<ApiCallResponse> call({
    String? projectId = '',
    int? limit,
    String? after = '',
    String? apiKeyAuth = '',
    String? apiKey,
  }) async {
    apiKey ??= FFAppConstants.apiKeyOpenAi;
    final baseUrl = OpenAIAPIGroup.getBaseUrl(
      apiKey: apiKey,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'list-project-users',
      apiUrl: '${baseUrl}/organization/projects/${projectId}/users',
      callType: ApiCallType.GET,
      headers: {
        'authorization': 'Bearer ${apiKey}',
        'Content-Type': 'application/json',
        'OpenAI-Beta': 'assistants=v2',
        'Authorization': 'Bearer ${apiKeyAuth}',
      },
      params: {
        'limit': limit,
        'after': after,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class CreateProjectUserCall {
  Future<ApiCallResponse> call({
    String? projectId = '',
    String? apiKeyAuth = '',
    String? apiKey,
  }) async {
    apiKey ??= FFAppConstants.apiKeyOpenAi;
    final baseUrl = OpenAIAPIGroup.getBaseUrl(
      apiKey: apiKey,
    );

    final ffApiRequestBody = '''
{
  "user_id": "",
  "role": "owner"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'create-project-user',
      apiUrl: '${baseUrl}/organization/projects/${projectId}/users',
      callType: ApiCallType.POST,
      headers: {
        'authorization': 'Bearer ${apiKey}',
        'Content-Type': 'application/json',
        'OpenAI-Beta': 'assistants=v2',
        'Authorization': 'Bearer ${apiKeyAuth}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class RetrieveProjectUserCall {
  Future<ApiCallResponse> call({
    String? projectId = '',
    String? userId = '',
    String? apiKeyAuth = '',
    String? apiKey,
  }) async {
    apiKey ??= FFAppConstants.apiKeyOpenAi;
    final baseUrl = OpenAIAPIGroup.getBaseUrl(
      apiKey: apiKey,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'retrieve-project-user',
      apiUrl: '${baseUrl}/organization/projects/${projectId}/users/${userId}',
      callType: ApiCallType.GET,
      headers: {
        'authorization': 'Bearer ${apiKey}',
        'Content-Type': 'application/json',
        'OpenAI-Beta': 'assistants=v2',
        'Authorization': 'Bearer ${apiKeyAuth}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class DeleteProjectUserCall {
  Future<ApiCallResponse> call({
    String? projectId = '',
    String? userId = '',
    String? apiKeyAuth = '',
    String? apiKey,
  }) async {
    apiKey ??= FFAppConstants.apiKeyOpenAi;
    final baseUrl = OpenAIAPIGroup.getBaseUrl(
      apiKey: apiKey,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'delete-project-user',
      apiUrl: '${baseUrl}/organization/projects/${projectId}/users/${userId}',
      callType: ApiCallType.DELETE,
      headers: {
        'authorization': 'Bearer ${apiKey}',
        'Content-Type': 'application/json',
        'OpenAI-Beta': 'assistants=v2',
        'Authorization': 'Bearer ${apiKeyAuth}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ListProjectServiceAccountsCall {
  Future<ApiCallResponse> call({
    String? projectId = '',
    int? limit,
    String? after = '',
    String? apiKeyAuth = '',
    String? apiKey,
  }) async {
    apiKey ??= FFAppConstants.apiKeyOpenAi;
    final baseUrl = OpenAIAPIGroup.getBaseUrl(
      apiKey: apiKey,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'list-project-service-accounts',
      apiUrl: '${baseUrl}/organization/projects/${projectId}/service_accounts',
      callType: ApiCallType.GET,
      headers: {
        'authorization': 'Bearer ${apiKey}',
        'Content-Type': 'application/json',
        'OpenAI-Beta': 'assistants=v2',
        'Authorization': 'Bearer ${apiKeyAuth}',
      },
      params: {
        'limit': limit,
        'after': after,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class CreateProjectServiceAccountCall {
  Future<ApiCallResponse> call({
    String? projectId = '',
    String? apiKeyAuth = '',
    String? apiKey,
  }) async {
    apiKey ??= FFAppConstants.apiKeyOpenAi;
    final baseUrl = OpenAIAPIGroup.getBaseUrl(
      apiKey: apiKey,
    );

    final ffApiRequestBody = '''
{
  "name": ""
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'create-project-service-account',
      apiUrl: '${baseUrl}/organization/projects/${projectId}/service_accounts',
      callType: ApiCallType.POST,
      headers: {
        'authorization': 'Bearer ${apiKey}',
        'Content-Type': 'application/json',
        'OpenAI-Beta': 'assistants=v2',
        'Authorization': 'Bearer ${apiKeyAuth}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class RetrieveProjectServiceAccountCall {
  Future<ApiCallResponse> call({
    String? projectId = '',
    String? serviceAccountId = '',
    String? apiKeyAuth = '',
    String? apiKey,
  }) async {
    apiKey ??= FFAppConstants.apiKeyOpenAi;
    final baseUrl = OpenAIAPIGroup.getBaseUrl(
      apiKey: apiKey,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'retrieve-project-service-account',
      apiUrl:
          '${baseUrl}/organization/projects/${projectId}/service_accounts/${serviceAccountId}',
      callType: ApiCallType.GET,
      headers: {
        'authorization': 'Bearer ${apiKey}',
        'Content-Type': 'application/json',
        'OpenAI-Beta': 'assistants=v2',
        'Authorization': 'Bearer ${apiKeyAuth}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class DeleteProjectServiceAccountCall {
  Future<ApiCallResponse> call({
    String? projectId = '',
    String? serviceAccountId = '',
    String? apiKeyAuth = '',
    String? apiKey,
  }) async {
    apiKey ??= FFAppConstants.apiKeyOpenAi;
    final baseUrl = OpenAIAPIGroup.getBaseUrl(
      apiKey: apiKey,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'delete-project-service-account',
      apiUrl:
          '${baseUrl}/organization/projects/${projectId}/service_accounts/${serviceAccountId}',
      callType: ApiCallType.DELETE,
      headers: {
        'authorization': 'Bearer ${apiKey}',
        'Content-Type': 'application/json',
        'OpenAI-Beta': 'assistants=v2',
        'Authorization': 'Bearer ${apiKeyAuth}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ListProjectApiKeysCall {
  Future<ApiCallResponse> call({
    String? projectId = '',
    int? limit,
    String? after = '',
    String? apiKeyAuth = '',
    String? apiKey,
  }) async {
    apiKey ??= FFAppConstants.apiKeyOpenAi;
    final baseUrl = OpenAIAPIGroup.getBaseUrl(
      apiKey: apiKey,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'list-project-api-keys',
      apiUrl: '${baseUrl}/organization/projects/${projectId}/api_keys',
      callType: ApiCallType.GET,
      headers: {
        'authorization': 'Bearer ${apiKey}',
        'Content-Type': 'application/json',
        'OpenAI-Beta': 'assistants=v2',
        'Authorization': 'Bearer ${apiKeyAuth}',
      },
      params: {
        'limit': limit,
        'after': after,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class RetrieveProjectApiKeyCall {
  Future<ApiCallResponse> call({
    String? projectId = '',
    String? keyId = '',
    String? apiKeyAuth = '',
    String? apiKey,
  }) async {
    apiKey ??= FFAppConstants.apiKeyOpenAi;
    final baseUrl = OpenAIAPIGroup.getBaseUrl(
      apiKey: apiKey,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'retrieve-project-api-key',
      apiUrl: '${baseUrl}/organization/projects/${projectId}/api_keys/${keyId}',
      callType: ApiCallType.GET,
      headers: {
        'authorization': 'Bearer ${apiKey}',
        'Content-Type': 'application/json',
        'OpenAI-Beta': 'assistants=v2',
        'Authorization': 'Bearer ${apiKeyAuth}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class DeleteProjectApiKeyCall {
  Future<ApiCallResponse> call({
    String? projectId = '',
    String? keyId = '',
    String? apiKeyAuth = '',
    String? apiKey,
  }) async {
    apiKey ??= FFAppConstants.apiKeyOpenAi;
    final baseUrl = OpenAIAPIGroup.getBaseUrl(
      apiKey: apiKey,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'delete-project-api-key',
      apiUrl: '${baseUrl}/organization/projects/${projectId}/api_keys/${keyId}',
      callType: ApiCallType.DELETE,
      headers: {
        'authorization': 'Bearer ${apiKey}',
        'Content-Type': 'application/json',
        'OpenAI-Beta': 'assistants=v2',
        'Authorization': 'Bearer ${apiKeyAuth}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

/// End OpenAI API Group Code

/// Start RevenueCat Group Code

class RevenueCatGroup {
  static String getBaseUrl({
    String? apiKey = 'sk_jpbICoRNeluHOjUgpQqpRnMbyWcue',
  }) =>
      'https://api.revenuecat.com/v2';
  static Map<String, String> headers = {
    'Content-Type': 'application/json',
    'Authorization': 'Bearer [apiKey]',
  };
  static GetCostumerCall getCostumerCall = GetCostumerCall();
  static ProductsCall productsCall = ProductsCall();
  static NewSubCall newSubCall = NewSubCall();
}

class GetCostumerCall {
  Future<ApiCallResponse> call({
    String? projectId = '67a495f5',
    String? customerId = '',
    String? apiKey = 'sk_jpbICoRNeluHOjUgpQqpRnMbyWcue',
  }) async {
    final baseUrl = RevenueCatGroup.getBaseUrl(
      apiKey: apiKey,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'get costumer',
      apiUrl: '${baseUrl}/projects/${projectId}/customers/${customerId}',
      callType: ApiCallType.GET,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${apiKey}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List<String>? currSubID(dynamic response) => (getJsonField(
        response,
        r'''$.active_entitlements.items[0].entitlement_id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class ProductsCall {
  Future<ApiCallResponse> call({
    String? projectId = '67a495f5',
    String? apiKey = 'sk_jpbICoRNeluHOjUgpQqpRnMbyWcue',
  }) async {
    final baseUrl = RevenueCatGroup.getBaseUrl(
      apiKey: apiKey,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'products',
      apiUrl: '${baseUrl}/projects/${projectId}/entitlements',
      callType: ApiCallType.GET,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${apiKey}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class NewSubCall {
  Future<ApiCallResponse> call({
    String? customerId = '',
    String? apiKey = 'sk_jpbICoRNeluHOjUgpQqpRnMbyWcue',
  }) async {
    final baseUrl = RevenueCatGroup.getBaseUrl(
      apiKey: apiKey,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'newSub',
      apiUrl: '${baseUrl}subscribers/${customerId}',
      callType: ApiCallType.GET,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${apiKey}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

/// End RevenueCat Group Code

class NewSubDetailsCall {
  static Future<ApiCallResponse> call({
    String? customerId = '',
    String? apiKey = 'sk_aXsdJhFtvkiGNYNhaRznesRtwywtf',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'New Sub Details',
      apiUrl: 'https://api.revenuecat.com/v1/subscribers/${customerId}',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${apiKey}',
        'Content-Type': 'application/json',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static String? entl75e9162b69(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.subscriber.entitlements.Adventurer.purchase_date''',
      ));
  static String? entl8b6abab155(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.subscriber.entitlements.Champion.purchase_date''',
      ));
  static String? entl054b154c1b(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.subscriber.entitlements.explorer.purchase_date''',
      ));
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _toEncodable(dynamic item) {
  if (item is DocumentReference) {
    return item.path;
  }
  return item;
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("List serialization failed. Returning empty list.");
    }
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("Json serialization failed. Returning empty json.");
    }
    return isList ? '[]' : '{}';
  }
}
