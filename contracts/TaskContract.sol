// SPDX-License-Identifier: MIT
pragma solidity ^0.8.11;

contract TasksContract {
    uint256 public taskCounter = 0;

    constructor() {
        createTask("mi primer tarea de ejemplo", "tengo que hacer algo");
    }

    struct Task {
        uint256 id;
        string title;
        string description;
        bool done;
        uint256 createdAt;
    }

    mapping(uint256 => Task) public tasks;

    event TaskCreated(
        uint256 id,
        string title,
        string description,
        bool done,
        uint256 createdAt
    );

    event TaskToggleDone(uint256 id, bool done);

    function createTask(string memory _title, string memory _description)
        public
    {
        taskCounter++;

        tasks[taskCounter] = Task(
            taskCounter,
            _title,
            _description,
            false,
            block.timestamp
        );

        emit TaskCreated(
            taskCounter,
            _title,
            _description,
            false,
            block.timestamp
        );
    }

    function toggleDone(uint256 _id) public {
        Task memory _task = tasks[_id];
        _task.done = !_task.done;
        tasks[_id] = _task;

        emit TaskToggleDone(_id, _task.done);
    }
}
