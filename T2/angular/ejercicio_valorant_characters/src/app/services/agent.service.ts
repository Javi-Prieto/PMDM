import { HttpClient, HttpParams } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { AgentListResponse } from '../models/agent-list.interface';
import { Observable } from 'rxjs';
import { AgentDetailsResponses } from '../models/agent-details.interface';

@Injectable({
  providedIn: 'root'
})
export class AgentService {

  constructor(private http: HttpClient) { }

  getListAgents():Observable<AgentListResponse>{
    return this.http.get<AgentListResponse>('https://valorant-api.com/v1/agents');
  }
  getAgentByUUID(uuid:String):Observable<AgentDetailsResponses>{
    return this.http.get<AgentDetailsResponses>(`https://valorant-api.com/v1/agents/${uuid}`);
  }
}
