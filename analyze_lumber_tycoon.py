#!/usr/bin/env python3
"""
Comprehensive analysis of Lumber Tycoon 2 codebase
"""

import os
import re
from pathlib import Path
from collections import defaultdict, Counter

def analyze_codebase(root_dir):
    """Analyze the Lumber Tycoon 2 codebase structure and content"""
    
    root_path = Path(root_dir)
    lua_files = list(root_path.rglob("*.lua"))
    
    print(f"=== LUMBER TYCOON 2 CODEBASE ANALYSIS ===")
    print(f"Total Lua files found: {len(lua_files)}")
    print()
    
    # Analyze file structure
    print("=== FILE STRUCTURE ANALYSIS ===")
    structure = defaultdict(list)
    
    for file_path in lua_files:
        relative_path = file_path.relative_to(root_path)
        parts = relative_path.parts
        
        if len(parts) >= 2:
            category = parts[1]  # src/StarterGui, src/ReplicatedStorage, etc.
            structure[category].append(str(relative_path))
    
    for category, files in sorted(structure.items()):
        print(f"\n{category}: {len(files)} files")
        # Show first few files as examples
        for file in sorted(files)[:5]:
            print(f"  - {file}")
        if len(files) > 5:
            print(f"  ... and {len(files) - 5} more")
    
    # Analyze file types and patterns
    print("\n=== FILE TYPE ANALYSIS ===")
    file_types = Counter()
    
    for file_path in lua_files:
        if file_path.name.endswith('.client.lua'):
            file_types['Client Scripts'] += 1
        elif file_path.name.endswith('.server.lua'):
            file_types['Server Scripts'] += 1
        elif file_path.name.endswith('.lua'):
            file_types['Module Scripts'] += 1
    
    for file_type, count in file_types.most_common():
        print(f"{file_type}: {count}")
    
    # Analyze code content
    print("\n=== CODE CONTENT ANALYSIS ===")
    
    total_lines = 0
    total_chars = 0
    function_count = 0
    remote_events = set()
    gui_elements = set()
    
    # Keywords to look for
    keywords = {
        'RemoteEvent': 0,
        'RemoteFunction': 0,
        'BindableEvent': 0,
        'BindableFunction': 0,
        'UserInputService': 0,
        'TweenService': 0,
        'HttpService': 0,
        'DataStoreService': 0,
        'MarketplaceService': 0,
        'Players': 0,
        'Workspace': 0,
        'ReplicatedStorage': 0,
        'StarterGui': 0,
    }
    
    interesting_files = []
    
    for file_path in lua_files:
        try:
            with open(file_path, 'r', encoding='utf-8', errors='ignore') as f:
                content = f.read()
                lines = content.split('\n')
                
                total_lines += len(lines)
                total_chars += len(content)
                
                # Count functions
                function_matches = re.findall(r'function\s+\w+', content)
                function_count += len(function_matches)
                
                # Look for keywords
                for keyword in keywords:
                    if keyword in content:
                        keywords[keyword] += 1
                
                # Find RemoteEvents
                remote_matches = re.findall(r'(\w+RemoteEvent|\w+Remote)', content)
                remote_events.update(remote_matches)
                
                # Find GUI elements
                gui_matches = re.findall(r'(\w+GUI|\w+Frame|\w+Button)', content)
                gui_elements.update(gui_matches)
                
                # Identify interesting files (large or important)
                if len(content) > 5000 or 'main' in file_path.name.lower() or 'core' in file_path.name.lower():
                    interesting_files.append((file_path, len(content), len(lines)))
                    
        except Exception as e:
            print(f"Error reading {file_path}: {e}")
    
    print(f"Total lines of code: {total_lines:,}")
    print(f"Total characters: {total_chars:,}")
    print(f"Total functions found: {function_count:,}")
    
    print(f"\n=== ROBLOX SERVICES USAGE ===")
    for service, count in sorted(keywords.items(), key=lambda x: x[1], reverse=True):
        if count > 0:
            print(f"{service}: {count} files")
    
    print(f"\n=== REMOTE EVENTS FOUND ===")
    for remote in sorted(list(remote_events)[:20]):  # Show first 20
        print(f"  - {remote}")
    if len(remote_events) > 20:
        print(f"  ... and {len(remote_events) - 20} more")
    
    print(f"\n=== GUI ELEMENTS FOUND ===")
    for gui in sorted(list(gui_elements)[:20]):  # Show first 20
        print(f"  - {gui}")
    if len(gui_elements) > 20:
        print(f"  ... and {len(gui_elements) - 20} more")
    
    print(f"\n=== LARGEST/MOST IMPORTANT FILES ===")
    for file_path, char_count, line_count in sorted(interesting_files, key=lambda x: x[1], reverse=True)[:10]:
        relative_path = file_path.relative_to(root_path)
        print(f"{relative_path}: {char_count:,} chars, {line_count:,} lines")
    
    return lua_files, interesting_files

def analyze_specific_file(file_path, max_lines=100):
    """Analyze a specific file in detail"""
    print(f"\n=== ANALYZING: {file_path} ===")
    
    try:
        with open(file_path, 'r', encoding='utf-8', errors='ignore') as f:
            content = f.read()
            lines = content.split('\n')
            
        print(f"File size: {len(content):,} characters, {len(lines):,} lines")
        
        # Show first part of the file
        print(f"\n--- FIRST {min(max_lines, len(lines))} LINES ---")
        for i, line in enumerate(lines[:max_lines], 1):
            print(f"{i:3d}: {line}")
        
        if len(lines) > max_lines:
            print(f"... ({len(lines) - max_lines} more lines)")
            
        # Analyze functions
        functions = re.findall(r'function\s+(\w+)', content)
        if functions:
            print(f"\n--- FUNCTIONS FOUND ---")
            for func in functions[:10]:
                print(f"  - {func}")
            if len(functions) > 10:
                print(f"  ... and {len(functions) - 10} more")
        
        # Look for important patterns
        patterns = {
            'Remote Events': re.findall(r'(\w*RemoteEvent\w*)', content),
            'GUI Elements': re.findall(r'(\w*GUI\w*|\w*Frame\w*|\w*Button\w*)', content),
            'Services': re.findall(r'game:GetService\("(\w+)"\)', content),
            'Wait Calls': re.findall(r'wait\(([^)]*)\)', content),
        }
        
        for pattern_name, matches in patterns.items():
            if matches:
                unique_matches = list(set(matches))[:10]
                print(f"\n--- {pattern_name.upper()} ---")
                for match in unique_matches:
                    print(f"  - {match}")
                if len(unique_matches) == 10 and len(set(matches)) > 10:
                    print(f"  ... and {len(set(matches)) - 10} more")
                    
    except Exception as e:
        print(f"Error analyzing file: {e}")

if __name__ == "__main__":
    root_dir = "/workspace/lumber_tycoon_rojo_project/place 13822889 Lumber Tycoon 2"
    
    # Overall analysis
    lua_files, interesting_files = analyze_codebase(root_dir)
    
    # Analyze some specific interesting files
    print("\n" + "="*80)
    print("DETAILED FILE ANALYSIS")
    print("="*80)
    
    # Analyze top 3 most interesting files
    for file_path, char_count, line_count in interesting_files[:3]:
        analyze_specific_file(file_path, max_lines=50)
        print("\n" + "-"*80)