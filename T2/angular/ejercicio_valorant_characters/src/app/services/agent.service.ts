import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Agent, AgentListResponse } from '../models/agentList.interface';
import { Observable } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class AgentService {

  constructor(private http: HttpClient) { }

  getListAgents():Observable<AgentListResponse>{
    return this.http.get<AgentListResponse>('https://valorant-api.com/v1/agents');
  }
}
