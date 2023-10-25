import { Component, OnInit } from '@angular/core';
import { Agent } from 'src/app/models/agentList.interface';
import { AgentService } from 'src/app/services/agent.service';

@Component({
  selector: 'app-agent-list',
  templateUrl: './agent-list.component.html',
  styleUrls: ['./agent-list.component.css']
})
export class AgentListComponent implements OnInit{
  agentList :Agent[] = [];

  constructor(private agentService: AgentService){}
  ngOnInit(): void {
    this.agentService.getListAgents().subscribe(answ => this.agentList = answ.data);
  }


}
